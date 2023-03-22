# BeapOverflow (Bss Overflow -> Heap Overflow)

This is a finding for address randomization. There could be no gap between the bss segment and the heap area.

It's not a secure design since people can overflow from bss to heap and partially write important data on the tcache management structure. 

We can brute force 0x1fff times (excepted) to perform BeapOverflow.

This trick is even feasible for recent glibc, which implemented safe linking.

But we need to overflow at least more than one page on bss, which is rare.


More research is needed.
- Read the source code
- ...

# PoC
- Compile the c coude: [main.c](./main.c)
- Run the python script several times to see the range of the offset: [exp.py](./exp.py)

![PoC](image.png)

# Max Range in Test
0 - 0x1fff

