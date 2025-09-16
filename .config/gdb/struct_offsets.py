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

        # Compute column widths based on top-level struct size so all nested rows align
        max_offset_val = 0 + typ.sizeof
        offset_col_width = max(len("offset"), len(f"offset={max_offset_val}"))
        size_col_width = max(len("size"), len(f"size={typ.sizeof}"))

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
            offset_col_width = max(len("offset"), len(f"offset={base_offset + typ.sizeof}"))
        if size_col_width is None:
            size_col_width = max(len("size"), len(f"size={typ.sizeof}"))

        tag = typ.tag or str(typ)
        if tag in visited:
            branch = "└── " if is_last else "├── "
            print(f"{'':<{offset_col_width}} {'':<{size_col_width}} {prefix}{branch}... (already visited {tag})")
            return
        visited.add(tag)

        fields = typ.fields()
        current_offset = base_offset

        for idx, f in enumerate(fields):
            is_last_field = (idx == len(fields) - 1)

            # Determine field offset in bytes.
            # bitpos exists for bitfields; otherwise default to current_offset
            if hasattr(f, 'bitpos') and f.bitpos is not None:
                offset = base_offset + (f.bitpos // 8)
            else:
                # fallback: if gdb exposes field.offset (not guaranteed), use it; otherwise use current_offset
                offset = getattr(f, "offset", None)
                if offset is None:
                    offset = current_offset

            size = f.type.sizeof

            # Padding before this field
            if offset > current_offset:
                padding_size = offset - current_offset
                offset_str = f"offset={current_offset}"
                size_str = f"size={padding_size}"
                branch = "└── " if is_last_field else "├── "
                print(f"{offset_str:<{offset_col_width}} {size_str:<{size_col_width}} {prefix}{branch}<padding>")

            # Field line
            offset_str = f"offset={offset}"
            size_str = f"size={size}"
            name = f.name if f.name else (f.type.tag or f.type.name or "<anonymous>")
            branch = "└── " if is_last_field else "├── "
            print(f"{offset_str:<{offset_col_width}} {size_str:<{size_col_width}} {prefix}{branch}{name}")

            # Prepare prefix for children: keep vertical '│' if not last, otherwise spaces
            new_prefix = prefix + ("    " if is_last_field else "│   ")

            # Recurse into nested struct types
            if f.type.code == gdb.TYPE_CODE_STRUCT:
                self.print_struct(f.type.strip_typedefs(), base_offset=offset,
                                  prefix=new_prefix, is_last=is_last_field,
                                  visited=visited.copy(),
                                  offset_col_width=offset_col_width,
                                  size_col_width=size_col_width)

            # Update current_offset: use max to handle unions/overlapping fields safely
            current_offset = max(current_offset, offset + size)

        # Trailing padding (at end of struct)
        total_size = typ.sizeof
        if current_offset < base_offset + total_size:
            padding_size = base_offset + total_size - current_offset
            offset_str = f"offset={current_offset}"
            size_str = f"size={padding_size}"
            print(f"{offset_str:<{offset_col_width}} {size_str:<{size_col_width}} {prefix}{'└── '}<trailing padding>")


StructOffsetsCommand()
