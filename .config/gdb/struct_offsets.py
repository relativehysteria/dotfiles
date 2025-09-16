import gdb

class StructOffsetsCommand(gdb.Command):
    """Print struct layout as a tree with offset/size column: offsets [type] <TypeName>"""

    def __init__(self):
        super(StructOffsetsCommand, self).__init__("offsets", gdb.COMMAND_USER)

    def invoke(self, arg, from_tty):
        if not arg:
            print("Usage: offsets [type] <TypeName>")
            return

        args = arg.split()
        show_type = False

        if args[0] == "type":
            show_type = True
            args = args[1:]

        if not args:
            print("Usage: offsets [type] <TypeName>")
            return

        type_name = args[0]

        try:
            typ = gdb.lookup_type(type_name).strip_typedefs()
        except gdb.error:
            print(f"Could not resolve type: {type_name}")
            return

        if typ.code != gdb.TYPE_CODE_STRUCT:
            print(f"Type is not a struct: {typ}")
            return

        max_offset_val = 0 + typ.sizeof
        offset_col_width = max(len("offset"), len(f"offset=0x{max_offset_val:X}"))
        size_col_width = max(len("size"), len(f"size=0x{typ.sizeof:X}"))

        print(f"{'offset':<{offset_col_width}} {'size':<{size_col_width}} {typ.tag or typ.name or str(typ)}")

        self.print_struct(typ, base_offset=0, prefix="", is_last=True,
                          visited=set(),
                          offset_col_width=offset_col_width,
                          size_col_width=size_col_width,
                          show_type=show_type)

    def print_struct(self, typ, base_offset=0, prefix="", is_last=True, visited=None,
                     offset_col_width=None, size_col_width=None, show_type=False):
        if visited is None:
            visited = set()

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

        fields = typ.fields()
        field_infos = []
        scan_current = base_offset
        for f in fields:
            if hasattr(f, 'bitpos') and f.bitpos is not None:
                offset = base_offset + (f.bitpos // 8)
            else:
                offset = getattr(f, "offset", None)
                if offset is None:
                    offset = scan_current
            size = f.type.sizeof
            field_infos.append((f, offset, size))
            scan_current = max(scan_current, offset + size)

        total_size = typ.sizeof
        trailing_exists = (scan_current < base_offset + total_size)

        current_offset = base_offset
        for idx, (f, offset, size) in enumerate(field_infos):
            is_last_field = (idx == len(field_infos) - 1) and (not trailing_exists)

            if offset > current_offset:
                padding_size = offset - current_offset
                offset_str = f"offset=0x{current_offset:X}"
                size_str = f"size=0x{padding_size:X}"
                branch = ("└ " if is_last_field else "├ ") + "[PADDING]"
                print(f"{offset_str:<{offset_col_width}} {size_str:<{size_col_width}} {prefix}{branch}")

            offset_str = f"offset=0x{offset:X}"
            size_str = f"size=0x{size:X}"
            name = f.name if f.name else (f.type.tag or f.type.name or "<anonymous>")
            branch = "└── " if is_last_field else "├── "

            line = f"{offset_str:<{offset_col_width}} {size_str:<{size_col_width}} {prefix}{branch}{name}"
            if show_type:
                field_type = str(f.type.strip_typedefs())
                line += f" : {field_type}"
            print(line)

            new_prefix = prefix + ("    " if is_last_field else "│   ")

            if f.type.code == gdb.TYPE_CODE_STRUCT:
                self.print_struct(f.type.strip_typedefs(), base_offset=offset,
                                  prefix=new_prefix, is_last=is_last_field,
                                  visited=visited.copy(),
                                  offset_col_width=offset_col_width,
                                  size_col_width=size_col_width,
                                  show_type=show_type)

            current_offset = max(current_offset, offset + size)

        if current_offset < base_offset + total_size:
            padding_size = base_offset + total_size - current_offset
            offset_str = f"offset=0x{current_offset:X}"
            size_str = f"size=0x{padding_size:X}"
            print(f"{offset_str:<{offset_col_width}} {size_str:<{size_col_width}} {prefix}{'└ [TRAILING PADDING]'}")


StructOffsetsCommand()
