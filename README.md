# Update

This issue is fixed at this [commit][2]
But the .bss can still connect to the heap. The chance is 1024/1G, which is small enough

# BeapOverflow (Bss Overflow -> Heap Overflow)

This is a finding for address randomization. There could be no gap between the `bss` segment and the heap area.

It's not a secure design since people can overflow from `bss` to heap and partially write important data on the tcache management structure. 

We can brute force 0x2000 times (ideally) to perform BeapOverflow.

But we need to overflow at least more than one page on `bss`, which is rare.


# PoC
- Compile the c coude: [main.c](./main.c)
- Run the Python script several times to see the range of the offset: [exp.py](./exp.py)

![PoC](image.png)

# Max Range
0 - 0x1fff

# Source Code Reading
I located the file after reading this [article][1] and the source code confirmed the correctness of my code:

https://elixir.bootlin.com/linux/v6.8/source/arch/x86/kernel/process.c#L1031

# Reason

Still using x86's value(0x2000) even though we have more space.


[1]: https://www.cnblogs.com/wangaohui/p/7122653.html
[2]: https://github.com/torvalds/linux/commit/685d98211273f60e38a6d361b62d7016c545297e#diff-4dd434086fa3d909f159202a82af12e0f3409a90a28d45dededeeac8be2c6810L1033
