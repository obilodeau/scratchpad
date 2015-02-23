; modified from http://en.wikibooks.org/wiki/X86_Assembly/Control_Flow
; under Creative-Commons Attribution / Share-Alike
;
; nasm -felf32 -g jumps.asm
; gcc -m32 -o jumps jumps.o
;
global main 
 
extern printf
 
section .data
        sfneofStr: db 'SF <> OF', 0xA, 0
        sfeqofStr: db 'SF == OF', 0xA, 0

        takenStr: db 'jump taken', 0xA, 0
        nottakenStr: db 'jump NOT taken', 0xA, 0

        equalityTestStr: db 'testing equality: ', 0
        lesserTestStr: db 'testing eax lesser than: ', 0
        greaterTestStr: db 'testing eax greater than: ', 0
 
section .bss
 
section .text
        main:
 
;
; Functions will follow the cdecl call convention
;
 
        ;
        ; arg2 < arg1 and no overflow
        ;
        mov     eax, 1
        cmp     eax, 2
        call    checkSFNEOF
 
        ;
        ; arg2 < arg1 and overflow
        ;
        mov     al, -2
        cmp     al, 127
        call    checkSFNEOF
 
        ;
        ; arg2 > arg1 and no overflow
        ;
        mov     eax, 2
        cmp     eax, 1 
        call    checkSFNEOF
 
        ;
        ; arg2 > arg1 and overflow
        ;
        mov     al, 127
        cmp     al, -1 
        call    checkSFNEOF
 
        ;
        ; arg2 == arg1
        ;
        mov     eax, 2
        cmp     eax, 2 
        call    checkSFNEOF

        push    dword equalityTestStr
        call    printf  
        mov     eax, 2
        cmp     eax, 2
        call    TEST

        push    dword lesserTestStr
        call    printf
        mov     eax, 1
        cmp     eax, 2
        call    TEST

        push    dword greaterTestStr 
        call    printf
        mov     eax, 3
        cmp     eax, 2
        call    TEST
 
        call    exit
 
;
; Check if SF <> OF, which means the condition for jump less would be meet. 
;
checkSFNEOF:
        push    ebp
        mov     ebp, esp
 
        jl      SFNEOF
        jmp     SFEQOF  
 
SFNEOF:
        push    dword sfneofStr 
        call    printf
        jmp     checkSFNEOFDone
 
SFEQOF:
        push    dword sfeqofStr 
        call    printf

checkSFNEOFDone:
        leave
        ret

TEST:
        push    ebp
        mov     ebp, esp
        jl      TAKEN
        push    dword nottakenStr
        call    printf
        leave
        ret

TAKEN:
        push    dword takenStr
        call    printf
        leave
        ret
 
exit:
                                ;
                                ; Call exit(3) syscall
                                ;       void exit(int status)
                                ;
        mov     ebx, 0          ; Arg one: the status
        mov     eax, 1          ; Syscall number:
        int     0x80
