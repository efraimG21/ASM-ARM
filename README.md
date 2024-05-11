# ASM-ARM


# Program Documentation: hello.s

## Purpose:
This assembly program is a simple example demonstrating how to use system calls on macOS to print "hello world" and another string to the console.

## Instructions for Compilation and Execution:
To compile the program, open the terminal and navigate to the directory containing the source file (hello.s). Then execute the following commands:

```bash
as hello.s -o hello.o
ld hello.o -o hello -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64
```

To run the compiled program, execute:

```bash
./hello
```

## Program Structure:

### Entry Point (_main):
- The `_main` function is the entry point of the program.
- It branches to the `_printf` subroutine to print "hello world".
- After printing, it branches to `_terminate` to exit the program.

### Subroutine (_printf):
- The `_printf` subroutine uses system calls to print two strings:
  - "hello world\n"
  - "efraim\n"
- It first sets up the system call parameters:
  - `mov X0, #1`: Sets up the file descriptor for standard output.
  - `adr X1, helloworld`: Loads the address of the "hello world" string.
  - `mov X2, #12`: Sets the length of the string.
  - `mov X16, #4`: Sets the system call number for writing to the console.
  - `svc 0`: Issues the system call to print the string.
- Similarly, it prints the second string "efraim\n" using the same system call mechanism.

### Subroutine (_terminate):
- The `_terminate` subroutine is responsible for terminating the program.
- It sets up the system call parameters to exit the program:
  - `mov X0, #0`: Sets the exit status to 0 (indicating success).
  - `mov X16, #1`: Sets the system call number for program termination.
  - `svc 0`: Issues the system call to terminate the program.

### String Definitions:
- `helloworld`: Defines the "hello world" string to be printed.
- `myname`: Defines the "efraim" string to be printed.

## External Resources:
- The program utilizes system calls provided by the macOS operating system.
- The `syscalls.master` file in the XNU source code provides documentation for system calls used in macOS.
```
