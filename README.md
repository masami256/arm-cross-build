# cross build environment

This is sample cross build environment

## setup

Install qemu-user-static package.

Then make sure proc-sys-fs.binfmt_misc.mount service is worked.

```
masami@saga:~$ systemctl status proc-sys-fs-binfmt_misc.mount
● proc-sys-fs-binfmt_misc.mount - Arbitrary Executable File Formats File System
   Loaded: loaded (/usr/lib/systemd/system/proc-sys-fs-binfmt_misc.mount; static; vendor preset: disabled)
   Active: active (mounted) since Thu 2018-10-11 20:07:16 JST; 2h 2min ago
    Where: /proc/sys/fs/binfmt_misc
     What: binfmt_misc
     Docs: https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.html
           https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
    Tasks: 0 (limit: 4915)
   Memory: 60.0K
   CGroup: /system.slice/proc-sys-fs-binfmt_misc.mount

Oct 11 20:07:16 saga systemd[1]: Mounting Arbitrary Executable File Formats File System...
Oct 11 20:07:16 saga systemd[1]: Mounted Arbitrary Executable File Formats File System.
```

And check /proc/sys/fs/binfmt_misc directory contains these files(maybe you need reboot or restart proc-sys-fs.binfmt_misc.mount).

```
masami@saga:~$ ls /proc/sys/fs/binfmt_misc/
./            qemu-aarch64_be  qemu-armeb  qemu-microblaze    qemu-mips64    qemu-mipsn32    qemu-ppc      qemu-riscv32  qemu-sh4          qemu-xtensa    status
../           qemu-alpha       qemu-hppa   qemu-microblazeel  qemu-mips64el  qemu-mipsn32el  qemu-ppc64    qemu-riscv64  qemu-sh4eb        qemu-xtensaeb
qemu-aarch64  qemu-arm         qemu-m68k   qemu-mips          qemu-mipsel    qemu-or1k       qemu-ppc64le  qemu-s390x    qemu-sparc32plus  register
```

## run

Do docker-compose up!

```
masami@saga:~/codes/arm-cross-build$ sudo docker-compose up
Creating arm-cross-build_builder_1 ... done
Attaching to arm-cross-build_builder_1
builder_1  | rm -f hello
builder_1  | cc hello.c -o hello
builder_1  | file ./hello
builder_1  | ./hello: ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, BuildID[sha1]=39cbef1ba26dcae61413b891b9bd4e9d202a5083, not stripped
builder_1  | ./hello
builder_1  | Hello, World
arm-cross-build_builder_1 exited with code 0
```
