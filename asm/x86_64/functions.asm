section .rodata
hello:  db "Hello, World! %d", 10

section .text
  extern printf
  extern exit
  global _start

_start:

  mov rdi, 0
  call hello_world
  call exit

hello_world:
  ; init stuff
  push rbp
  mov rbp, rsp

  ; main code
  mov al, 0 ; supposedly important for varargs
  mov rsi, 42
  mov rdi, hello
  call printf

  ; cleanup
  pop rbp
  ret
