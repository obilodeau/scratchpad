section .text
  global _start

_start:

  mov rdi, 42 ; this code has the answer!
  mov rax, 60 ; exit
  syscall

