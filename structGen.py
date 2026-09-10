import sys

for x in range(1, len(sys.argv)):
    structData = "struct none end"
    
    with open(sys.argv[x], "r") as f:
        structData = f.read()
    
    toks = structData.split()
    
    if len(toks) <= 3:
        exit(1)
    
    if toks[0] != "struct":
        exit(1)
    
    name = toks[1]
    types = []
    for i in range(2, len(toks), 2):
        n = toks[i]
        if n == "end":
            break
        typ = toks[i + 1]
        types.append((n, typ))
    
    rtypes = types.copy()
    rtypes.reverse()
    
    with open(f"{sys.argv[x]}.thrt", "w") as out:
        # struct
        out.write(f"struct {name}\n")
        for nam, typ in types:
            out.write(f"\t{typ} // {nam}\n")
        out.write("end\n")
        out.write("\n")
        # offsets
        out.write(f"const {name}:off({types[0][0]}) 0 end\n")
        out.write("\n")
        for i in range(1, len(types)):
            nam, typ = types[i]
            out.write(f"const {name}:off({nam})\n")
            out.write(f"\tsizeof {types[0][1]}\n")
            for _, typ2 in types[1:i]:
                out.write(f"\tsizeof {typ2} +\n")
            out.write("end\n")
            out.write("\n")
        # read
        out.write(f"define ,{name}\n")
        for nam, typ in types:
            out.write(f"\tdup {name}:off({nam}) + ,{typ} <>\n")
        out.write("\t_\n")
        out.write("end\n")
        out.write("\n")
        out.write(f"define .{name}\n")
        for nam, typ in rtypes:
            out.write(f"\t<> <+> {name}:off({nam}) + .{typ}\n")
        out.write("\t_\n")
        out.write("end\n")
        out.write("\n")
        for nam, typ in types:
            out.write(f"define ,{name}:{nam}\n")
            out.write(f"\t{name}:off({nam}) + ,{typ}\n")
            out.write("end\n")
            out.write("\n")
            out.write(f"define .{name}:{nam}\n")
            out.write(f"\t{name}:off({nam}) + .{typ}\n")
            out.write("end\n")
            out.write("\n")
    
