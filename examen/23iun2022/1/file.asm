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
	shr ecx, 2


; TODO1: Aflați suma și maximul vectorului și stocați datele în variabilele 'sum', 'max'
max_and_sum:

	.model small
	.stack 100h
	.data
		vector db 1, 2, 3, 4, 5, 6, 7, 8, 9
		suma db 0
		count db 9
	
	.code
		mov ax, @data
		mov ds, ax

		mov si, 0
		xor si, si
		xor cx, cx
		mov cl count 
	repeta:
		mov al, vector[si]
		add suma, al
		inc si
	loop repeta

	mov bx, ax
	mov ah,09
	lea dx,msg 
	int 21h
	mov ah,2
	mov dl,bl
	int 21h
	mov ah,2
	mov dl,bl
	int 21h

	mov ah,4ch
	int 21h
end
	
	PRINTF32 `Max este %u\n\x0`, [max]
	PRINTF32 `Sum este %u\n\x0`, [sum]

; TODO2: Aflați suma maximă posibila dacă vectorul ar fi complet și stocați-o în 'max_pos_sum'

add_byte_array_element:
	mov dl, byte [byte_array + ecx - 1]
	add eax,edx
	loop add_byte_array_element

	PRINTF32 `Max possible sum este %u\n\x0`, [max_pos_sum]
	PRINTF32 '%u\n\x0', eax


; TODO3: Aflați elementul lipsă folosind TODO1 si TODO2 și stocați-l  în 'missing number'

	def getMissingNo(A);
	n=len(A)
	total=n*(n+1)/2
	sum_of_A=sum(A)
	return total-sum_of_A

	A=[1, 2, 3, 4, 5, 6, 7, 8, 9]
	miss=getMissingNo(A)

	PRINTF32 `Missing number este %u\n\x0`, [missing_number]

	leave
	ret
