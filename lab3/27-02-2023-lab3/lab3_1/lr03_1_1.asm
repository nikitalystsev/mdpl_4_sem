;EXTRN определение[,определение].
;Указывает, что идентификатор определен в другом модуле. Определение описывает
;идентификатор и имеет следующий формат:
;имя:тип
;"Имя" - это идентификатор, который определен в другом модуле. "Тип" должен
;соответствовать типу идентификатора, указанному при его определении, и может
;быть следующим: NEAR, FAR, PROC, BYTE, WORD, DWORD, DATAPTR,
;CODEPTR, FWORD, PWORD, QWORD, TBYTE, ABS или именем структуры.
EXTRN output_X: near

;описан сегмент стека
STK SEGMENT PARA STACK 'STACK'
	db 100 dup(0)
STK ENDS

;описан сегмент данных
DSEG SEGMENT PARA PUBLIC 'DATA'
	X db 'R'
DSEG ENDS

;описан сегмент кода
CSEG SEGMENT PARA PUBLIC 'CODE'
	assume CS:CSEG, DS:DSEG, SS:STK
main:
	mov ax, DSEG
	mov ds, ax

	call output_X	

	mov ax, 4c00h
	int 21h
CSEG ENDS

;описывает идентификатор, как доступный из других модулей.
PUBLIC X

END main