
//to run the main type this commend on your cmd

//as hello.s -o hello.o
//ld hello.o -o hello -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64


//open source
//https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master


.global _main
.align 2

_main:
    b _printf
    b _terminate


_printf:
    mov X0, #1
    adr X1, helloworld
    mov X2, #12
    mov X16, #4
    svc 0
    mov X0, #1
    adr X1, myname
    mov X2, #12
    mov X16, #4
    svc 0


_terminate:
    mov X0, #0
    mov X16, #1
    svc 0


helloworld: .ascii "hello world\n"
myname: .ascii "efraim\n"