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

        print(f"{'offset':<12} {'size':<6} {typ.tag or typ.name}")

        self.print_struct(typ, base_offset=0, prefix="", is_last=True, visited=set())

    def print_struct(self, typ, base_offset=0, prefix="", is_last=True, visited=None):
        if visited is None:
            visited = set()

        tag = typ.tag or str(typ)
        if tag in visited:
            print(f"{'':<12} {'':<6} {prefix}{'└── ' if is_last else '├── '}... (already visited {tag})")
            return
        visited.add(tag)

        fields = typ.fields()
        current_offset = base_offset
        for idx, f in enumerate(fields):
            is_last_field = (idx == len(fields) - 1)

            # If the field has bitpos, use bitpos, otherwise calculate offset
            # from the previous field
            if hasattr(f, 'bitpos') and f.bitpos is not None:
                offset = base_offset + f.bitpos // 8
            else:
                offset = current_offset
            size = f.type.sizeof

            # Detect padding before this field
            if offset > current_offset:
                padding_size = offset - current_offset
                print(f"{'offset=' + str(current_offset):<12} {'size=' + str(padding_size):<6} {prefix}{'├── ' if not is_last_field else '└── '}<padding>")

            branch = "└── " if is_last_field else "├── "
            left_col = f"offset={offset:<3} size={size:<3}"
            print(f"{left_col:<12} {prefix}{branch}{f.name}")

            new_prefix = prefix + ("    " if is_last_field else "│   ")

            if f.type.code == gdb.TYPE_CODE_STRUCT:
                self.print_struct(f.type.strip_typedefs(), base_offset=offset,
                                  prefix=new_prefix, is_last=True, visited=visited.copy())

            current_offset = offset + size

        # Detect padding at end of struct
        total_size = typ.sizeof
        if current_offset < base_offset + total_size:
            padding_size = base_offset + total_size - current_offset
            print(f"{'offset=' + str(current_offset):<12} {'size=' + str(padding_size):<6} {prefix}{'└── '}<trailing padding>")


StructOffsetsCommand()
