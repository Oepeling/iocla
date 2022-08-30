%include "printf32.asm"

section .bss
	in_len resd 1
	res resd 50

section .data
	; db -> byte -> 1b
	; dw -> word -> 2b
	; dd -> doubleword -> 4b
	; dq -> quadword -> 8b
	arr dd 0,4,1,2,3,7,10
	ARRAY_SIZE equ $-arr
	M dd 2
	N dd 5

section .text
extern printf
global main


main:

	push ebp
	mov ebp, esp
	xor ecx, ecx

	; array size in ecx
	mov ecx, ARRAY_SIZE
	shr ecx, 2

; TODO1: daca primul element din arr se afla in interval [M, N]


; TODO2: cate elemente din arr se afla in interval [M, N]

	PRINTF32 `In interval: %u\n\x0`, [in_len]

; TODO3: construiti verctorul res

	
; TODO4: afisati elementele lui res pe aceeasi linie separate printr-un spatiu


	leave
	ret
