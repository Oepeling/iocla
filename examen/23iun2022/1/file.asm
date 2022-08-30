%include "printf32.asm"

section .bss
	max resd 1
	sum resd 1
	max_pos_sum resd 1
	missing_number resd 1

section .data
	; db -> byte -> 1b
	; dw -> word -> 2b
	; dd -> doubleword -> 4b
	; dq -> quadword -> 8b
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
	shr ecx, 2

	PRINTF32 `%u\n\x0`, [num + 4]

; TODO1: Aflați suma și maximul vectorului și stocați datele în variabilele 'sum', 'max'
max_and_sum:
	mov dword [sum], 0		; initializam suma cu 0
	mov dword [max], 0		; initializam maximul cu 0
	
loop1:
	cmp ecx, 0				; conditia de iesire din while
	je end_loop1			; iesirea din while (jump la final)
	dec ecx					; scad pozitia din vector cu 1

	mov ebx, [num + ecx * 4]
	add [sum], ebx			
	cmp [max], ebx
	jge end_if1
	mov [max], ebx
end_if1:
	
	jmp loop1
end_loop1:

	PRINTF32 `Max este %u\n\x0`, [max]
	PRINTF32 `Sum este %u\n\x0`, [sum]

; TODO2: Aflați suma maximă posibila dacă vectorul ar fi complet și stocați-o în 'max_pos_sum'
	mov ecx, ARRAY_SIZE
	shr ecx, 2

	mov eax, ecx
	add eax, 1
	imul eax, ecx
	shr eax, 1
	mov [max_pos_sum], eax

	PRINTF32 `Max possible sum este %u\n\x0`, [max_pos_sum]


; TODO3: Aflați elementul lipsă folosind TODO1 si TODO2 și stocați-l  în 'missing number'

	mov eax, [max_pos_sum]
	sub eax, [sum]
	mov [missing_number], eax
	PRINTF32 `Missing number este %u\n\x0`, [missing_number]

leave
	ret
