%include "printf32.asm"

section .text
    global main
    extern printf

main:
    ;cele trei numere se gasesc in eax, ebx si ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, 5
    ; TODO: aflati minimul
    PRINTF32 `%d\n\x0`, eax ; afiseaza minimul

    ret
