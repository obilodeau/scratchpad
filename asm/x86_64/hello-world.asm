section .rodata
hello:  db "Hello, World! %d", 10

section .text
  extern printf
  extern exit
  global _start

_start:

  mov al, 0 ; supposedly important for varargs
  mov rsi, 42
  mov rdi, hello
  call printf

  mov rdi, 0
  call exit

