import gdb

def ptr_to_int(ptr):
    return int(ptr.cast(gdb.lookup_type("uintptr_t")))

class PrintVectorCommand(gdb.Command):
    """Print or index into a std::vector. Usage:
       pvec <expr> [index]"""

    def __init__(self):
        super(PrintVectorCommand, self).__init__("pvec", gdb.COMMAND_USER)

    def invoke(self, arg, from_tty):
        args = gdb.string_to_argv(arg)
        if not args:
            print("Usage: pvec <expr> [index]")
            return

        expr = args[0]
        idx = int(args[1]) if len(args) > 1 else None

        try:
            val = gdb.parse_and_eval(expr)
        except gdb.error as e:
            print(f"Could not evaluate expression: {e}")
            return

        try:
            impl = val["_M_impl"]
            start = impl["_M_start"]
            finish = impl["_M_finish"]
            end_of_storage = impl["_M_end_of_storage"]

            elem_size = start.type.target().sizeof
            size = (ptr_to_int(finish) - ptr_to_int(start)) // elem_size
            capacity = (ptr_to_int(end_of_storage) - ptr_to_int(start)) // elem_size

            if idx is not None:
                if idx < 0 or idx >= size:
                    print(f"Index {idx} out of range (size={size})")
                    return
                elem = (start + idx).dereference()
                print(f"[{idx}] = {elem}")
            else:
                print(f"std::vector size={size}, capacity={capacity}")
                for i in range(size):
                    elem = (start + i).dereference()
                    print(f"[{i}] = {elem}")

        except gdb.error as e:
            print(f"Error accessing vector internals: {e}")

PrintVectorCommand()
