%include "printf32.asm"

section .bss
	max resd 1
	sum resd 1
	max_pos_sum resd 1
	missing_number resd 1

section .data
	num dd 0,4,1,2
	ARRAY_SIZE equ $-num

section .text
extern printf
global main


main:

	push ebp
	mov ebp, esp
	xor ecx, ecx

	; array size in ecx
	mov ecx, ARRAY_SIZE

	PRINTF32 `%u\n\x0`, dword [num + 4]

; TODO1: Aflați suma și maximul vectorului și stocați datele în variabilele 'sum', 'max'
max_and_sum:

	PRINTF32 `Max este %u\n\x0`, [max]
	PRINTF32 `Sum este %u\n\x0`, [sum]

; TODO2: Aflați suma maximă posibila dacă vectorul ar fi complet și stocați-o în 'max_pos_sum'

	PRINTF32 `Max possible sum este %u\n\x0`, [max_pos_sum]


; TODO3: Aflați elementul lipsă folosind TODO1 si TODO2 și stocați-l  în 'missing number'

	PRINTF32 `Missing number este %u\n\x0`, [missing_number]

	leave
	ret
