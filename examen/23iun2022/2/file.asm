extern printf
extern scanf
extern puts

section .rodata
  read_int_fmt: db "%d", 0
  print_int_crlf: db "%d", 0xa, 0xd, 0
  print_int_space: db "%d ", 0
  arr_fmt: db "v[%d] = ", 0
  crlf: db 0xa, 0xd, 0

section .data
  test_arr dd 1, 2, 3, 4, 5

section .bss
  p_arr resd 1
  counter resw 1

section .text
global main

; TODO a: Implementati functia void print_int_array(int *arr, int len) care afiseaza
;         un array de intregi "arr" de lungime "len" separati prin spatiu.
;         Apoi apelati functia in programul principal pentru array-ul de test
;         "test_arr" definit in sectiunea ".data".
;         ATENTIE: Functia printf modifica o parte din registrele de uz general.
print_int_array:
  ret
; TODO b: Implementati functia void read_int_array(int *arr, int len) care citeste
;         de la inputul standard un numar de "len" valori intregi pe care le
;         depune in array-ul primit ca parametru "arr".
;         Apoi apelati functia in programul principal pentru un array de 10
;         elemente alocat pe stiva functiei "main".
;         ATENTIE: Functia scanf modifica o parte din registrele de uz general.
read_int_array:
  ret

  ; TODO c: Implementati functia int count_odd(int *arr, int len) care intoarce
  ;         ca rezultat numarul de elemente impare pentru array-ul "arr" avand lungimea
  ;         "len" primite ca parametrii.
  ;         Apoi apelati acesta functie in programul principal pentru array-ul
  ;         citit de la tastatura si afisati rezultatul
count_odd:
  ret

; TODO d: Implementati functia int odd_number_freq(int *arr, int len) care intoarce
;         ca rezultat frecventa (in procente) a elementelor impare din array-ul
;         "arr" avand lungimea "len" primite ca parametrii.
;         Apoi apelati acesta functie in programul principal pentru array-ul
;         citit de la tastatura si afisati rezultatul.
odd_number_freq:
  ret

main:
    push ebp
    mov ebp, esp

    ;TODO a: Apelati functia print_int_array pentru array-ul de test "test_arr"
    ;        definit in sectiunea de date.


    ; TODO b: Alocati un array de 10 elemente intregi pe stiva si cititi valorile
    ;         elementelor de la inputul standard folosind functia read_int_array,
    ;         apoi afisati aceste elemente utilizand functia print_int_array
    ;         Hint: puteti salva adresa array-ului alocat intr-o variabila globala

    ; TODO c: Apelati functia int count_odd(int* a, int len) pentru array-ul
    ;         citit de la tastatura si afisati rezultatul obtinut.


    ; TODO d: Apelati functia int odd_number_freq(int* a, int len) pentru array-ul
    ;         citit de la tastatura si afisati rezultatul obtinut.

    ; Return 0.
    xor eax, eax
    leave
    ret
