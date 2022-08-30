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

; TODO1: se afla in interval

	mov eax, [M]
	cmp [arr], eax
	jge label1			; jump peste print -1 -> else
	PRINTF32 `-1\n\x0`
	jmp label2			; jump peste comparatia cu n -> la finalul ifului
label1:
	mov eax, [N]
	cmp [arr], eax
	jle label3			; jump peste print 1
	PRINTF32 `1\n\x0`
	jmp label2			; jump peste print 0
label3:
	PRINTF32 `0\n\x0`
label2:

;	if ([arr] < M) {
;		cout << -1;
;	} else if ([arr] > N) {
;		cout << 1;
;	} else {
;		cout << 0;
;	}

; TODO2: cate se afla in interval

	; ecx = lungimea vectorului
	mov ecx, ARRAY_SIZE
	shr ecx, 2

	; initializam in_len cu 0
	mov dword [in_len], 0

	; while sa parcurgem vectorul
	; initializare
	; [arr + 4 * ebx]
	mov ebx, 0

	; loop
loop_while1:
	cmp ebx, ecx
	je end_while1

	; cod din while
	mov eax, [M]
	cmp [arr + ebx * 4], eax
	; cmp a, b
	; jg <=> a > b
	jge label4			; jump peste print -1 -> else
	jmp label5			; jump peste comparatia cu n -> la finalul ifului
label4:
	mov eax, [N]
	cmp [arr + ebx * 4], eax
	jle label6			; jump peste print 1
	jmp label5			; jump peste print 0
label6:
	inc dword [in_len]
label5:

	inc ebx
	jmp loop_while1
end_while1:

	PRINTF32 `%u\n\x0`, [in_len]

; TODO3: construiti verctorul res

	; ecx = lungimea vectorului
	mov ecx, ARRAY_SIZE
	shr ecx, 2

	; initializam in_len cu 0
	mov dword [in_len], 0

	; while sa parcurgem vectorul
	; initializare
	; [arr + 4 * ebx]
	mov ebx, 0

	; loop
loop_while2:
	cmp ebx, ecx
	je end_while2

	; cod din while
	mov edx, [arr + ebx * 4]
	mov eax, [M]
	cmp edx, eax
	; cmp a, b
	; jg <=> a > b
	jge label7			; jump peste print -1 -> else
	jmp label8			; jump peste comparatia cu n -> la finalul ifului
label7:
	mov eax, [N]
	cmp edx, eax
	jle label9			; jump peste print 1
	jmp label8			; jump peste print 0
label9:
	mov eax, [in_len]
	mov [res + eax * 4], edx
	inc dword [in_len]
label8:

	inc ebx
	jmp loop_while2
end_while2:

; TODO4: afisati elementele lui res pe aceeasi linie separate printr-un spatiu

	; ecx = lungimea vectorului
	mov ecx, [in_len]

	; while sa parcurgem vectorul
	; initializare
	; [res + 4 * ebx]
	mov ebx, 0

	; loop
loop_while3:
	cmp ebx, ecx
	je end_while3

	; cod din while
	; afisam [res + 4 * ebx]
	PRINTF32 `%u \x0`, [res + ebx * 4]

	inc ebx
	jmp loop_while3
end_while3:

	PRINTF32 `\n\x0`

	leave
	ret
