from pwn import *
MIN = 0xfffff
MAX = 0x0
ct = 0 
while(ct < 0x4000):
    p = process("./main")
    off = int(p.readline()[:-1],10)
    p.close()
    if off < MIN:
        MIN = off
    if off > MAX:
        MAX = off
    ct += 1
    print(f"{MAX} {MIN}")
warning(hex(MIN))
warning(hex(MAX))