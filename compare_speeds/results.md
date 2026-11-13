# Assembly

```bash
RB:~/.../compare_speeds/Assembly$ time (nasm -felf64 speed.asm -o speed.o && ld speed.o -o speed && ./speed)

real    0m0.031s
user    0m0.028s
sys     0m0.003s
RB:~/.../compare_speeds/Assembly$ time (nasm -felf64 speed.asm -o speed.o && ld speed.o -o speed && ./speed)

real    0m0.028s
user    0m0.024s
sys     0m0.004s
RB:~/.../compare_speeds/Assembly$ time (nasm -felf64 speed.asm -o speed.o && ld speed.o -o speed && ./speed)

real    0m0.038s
user    0m0.034s
sys     0m0.004s
RB:~/.../compare_speeds/Assembly$ 
```

# C

```bash
RB:~/.../compare_speeds/C$ time (gcc speed.c "-o" speed && ./speed)

real    0m0.054s
user    0m0.040s
sys     0m0.014s
RB:~/.../compare_speeds/C$ time (gcc speed.c "-o" speed && ./speed)

real    0m0.056s
user    0m0.044s
sys     0m0.012s
RB:~/.../compare_speeds/C$ time (gcc speed.c "-o" speed && ./speed)

real    0m0.052s
user    0m0.038s
sys     0m0.014s
```

# Java

```bash
RB:~/.../compare_speeds/Java$ time (javac speed.java && java speed)

real    0m0.248s
user    0m0.581s
sys     0m0.075s
RB:~/.../compare_speeds/Java$ time (javac speed.java && java speed)

real    0m0.250s
user    0m0.570s
sys     0m0.077s
RB:~/.../compare_speeds/Java$ time (javac speed.java && java speed)

real    0m0.247s
user    0m0.574s
sys     0m0.057s
```

# Python

```bash
RB:~/.../compare_speeds/Python$ time python3.12 speed.py

real    0m1.378s
user    0m1.365s
sys     0m0.009s
RB:~/.../compare_speeds/Python$ time python3.12 speed.py

real    0m1.303s
user    0m1.300s
sys     0m0.002s
RB:~/.../compare_speeds/Python$ time python3.12 speed.py

real    0m1.358s
user    0m1.354s
sys     0m0.004s
```

