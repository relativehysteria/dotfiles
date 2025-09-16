import gdb

class StructOffsetsCommand(gdb.Command):
    """Print struct layout as a tree with offset/size column: offsets <TypeName>"""

    def __init__(self):
        super(StructOffsetsCommand, self).__init__("offsets", gdb.COMMAND_USER)

    def invoke(self, arg, from_tty):
        if not arg:
            print("Usage: offsets <TypeName>")
            return

        arg = arg.strip()

        try:
            typ = gdb.lookup_type(arg).strip_typedefs()
        except gdb.error:
            print(f"Could not resolve type: {arg}")
            return

        if typ.code != gdb.TYPE_CODE_STRUCT:
            print(f"Type is not a struct: {typ}")
            return

        # Compute column widths based on top-level struct size so nested rows align
        max_offset_val = 0 + typ.sizeof
        offset_col_width = max(len("offset"), len(f"offset=0x{max_offset_val:X}"))
        size_col_width = max(len("size"), len(f"size=0x{typ.sizeof:X}"))

        # Header
        print(f"{'offset':<{offset_col_width}} {'size':<{size_col_width}} {typ.tag or typ.name or str(typ)}")

        # Start recursive printing; pass widths so nested calls align
        self.print_struct(typ, base_offset=0, prefix="", is_last=True,
                          visited=set(),
                          offset_col_width=offset_col_width,
                          size_col_width=size_col_width)

    def print_struct(self, typ, base_offset=0, prefix="", is_last=True, visited=None,
                     offset_col_width=None, size_col_width=None):
        if visited is None:
            visited = set()

        # Fallback widths if called standalone
        if offset_col_width is None:
            offset_col_width = max(len("offset"), len(f"offset=0x{base_offset + typ.sizeof:X}"))
        if size_col_width is None:
            size_col_width = max(len("size"), len(f"size=0x{typ.sizeof:X}"))

        tag = typ.tag or str(typ)
        if tag in visited:
            branch = "└── " if is_last else "├── "
            print(f"{'':<{offset_col_width}} {'':<{size_col_width}} {prefix}{branch}... (already visited {tag})")
            return
        visited.add(tag)

        # --- PRE-SCAN FIELDS: compute each field's offset/size and whether trailing padding exists
        fields = typ.fields()
        field_infos = []
        scan_current = base_offset
        for f in fields:
            # compute offset same way we print later
            if hasattr(f, 'bitpos') and f.bitpos is not None:
                offset = base_offset + (f.bitpos // 8)
            else:
                offset = getattr(f, "offset", None)
                if offset is None:
                    offset = scan_current
            size = f.type.sizeof
            field_infos.append((f, offset, size))
            # update scan_current as max end (handles overlap/unions)
            scan_current = max(scan_current, offset + size)

        total_size = typ.sizeof
        trailing_exists = (scan_current < base_offset + total_size)

        # --- PRINTING PASS
        current_offset = base_offset
        for idx, (f, offset, size) in enumerate(field_infos):
            # If there will be trailing padding, the very last field shouldn't be treated as last
            is_last_field = (idx == len(field_infos) - 1) and (not trailing_exists)

            # Padding before this field
            if offset > current_offset:
                padding_size = offset - current_offset
                offset_str = f"offset=0x{current_offset:X}"
                size_str = f"size=0x{padding_size:X}"
                branch = ("└ " if is_last_field else "├ ") + "[PADDING]"
                print(f"{offset_str:<{offset_col_width}} {size_str:<{size_col_width}} {prefix}{branch}")

            # Field line
            offset_str = f"offset=0x{offset:X}"
            size_str = f"size=0x{size:X}"
            name = f.name if f.name else (f.type.tag or f.type.name or "<anonymous>")
            branch = "└── " if is_last_field else "├── "
            print(f"{offset_str:<{offset_col_width}} {size_str:<{size_col_width}} {prefix}{branch}{name}")

            # Prefix for children of this field
            new_prefix = prefix + ("    " if is_last_field else "│   ")

            # Recurse into nested struct types
            if f.type.code == gdb.TYPE_CODE_STRUCT:
                self.print_struct(f.type.strip_typedefs(), base_offset=offset,
                                  prefix=new_prefix, is_last=is_last_field,
                                  visited=visited.copy(),
                                  offset_col_width=offset_col_width,
                                  size_col_width=size_col_width)

            # Update current_offset for padding calculation (use max to be robust)
            current_offset = max(current_offset, offset + size)

        # Trailing padding (if any) — always the last child of the struct
        if current_offset < base_offset + total_size:
            padding_size = base_offset + total_size - current_offset
            offset_str = f"offset=0x{current_offset:X}"
            size_str = f"size=0x{padding_size:X}"
            # trailing padding is always the struct's last child, so use '└── '
            print(f"{offset_str:<{offset_col_width}} {size_str:<{size_col_width}} {prefix}{'└ [TRAILING PADDING]'}")


StructOffsetsCommand()
