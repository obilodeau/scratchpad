section .text
  extern exit
  global _start

_start:

  mov rdi, 42 ; this code has the answer!
  call exit

