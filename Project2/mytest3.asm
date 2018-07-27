; Name: Pearl Pongsuppat
; Email: ppongs1@umbc.edu
; Date: March 26, 2018
; File: mytest3.asm
;

;

%define STDIN 0
%define STDOUT 1
%define SYSCALL_EXIT  1
%define SYSCALL_READ  3
%define SYSCALL_WRITE 4


SECTION .data                   ; initialized data section

	lf:   	db  10            		 

	msg1:	db " plus "	
	len1 	equ $ - msg1

	msg2: 	db " minus "
	len2 	equ $ - msg2

	msg3:	db " equals "
	len3 	equ $ - msg3

SECTION .text                  
    global  _start                 
	extern	prt_dec

	;; Initializes registers 
	_start: 
		mov	ebx, 23456
		mov	edx, 789033
		mov	edi, 2223187809
		mov	ebp, 1553239991 


		push	dword 0x00FFEEEE
		call	prt_dec
		add	esp, 4
		call	prt_lf

		push	dword 0xFFFFAAAA
		call	prt_dec
		add		esp, 4
		call	prt_lf

		push	1234567
		call	prt_dec
		add	esp, 4
		call	prt_lf

		push	ebx
		call	prt_dec
		add	esp, 4
		call	prt_lf

		push	edx
		call	prt_dec
		add	esp, 4
		call	prt_lf

		push	55508876
		call	prt_dec
		add	esp, 4
		call	prt_lf

		push	ebp
		call	prt_dec
		add	esp, 4
		call	prt_lf

		push	50
		call	prt_dec
		add	esp, 4

        mov     eax, SYSCALL_WRITE      ; write message
        mov     ebx, STDOUT
        mov     ecx, msg1
        mov     edx, len1
        int     080h
	
	push	650
	call	prt_dec
	add	esp, 4

        mov     eax, SYSCALL_WRITE      ; write message
        mov     ebx, STDOUT
        mov     ecx, msg3
        mov     edx, len3
        int     080h

	push	700
	call	prt_dec
	add	esp, 4
	call	prt_lf

	push	90
	call	prt_dec
	add	esp, 4

        mov     eax, SYSCALL_WRITE      ; write message
        mov     ebx, STDOUT
        mov     ecx, msg2
        mov     edx, len2
        int     080h
	
	push	70
	call	prt_dec
	add	esp, 4

        mov     eax, SYSCALL_WRITE      ; write message
        mov     ebx, STDOUT
        mov     ecx, msg3
        mov     edx, len3
        int     080h

	push	20
	call	prt_dec
	add	esp, 4
	call	prt_lf


        ; final exit
        ;
exit:   mov     EAX, SYSCALL_EXIT       ; exit function
	mov     EBX, 0                  ; exit code, 0=normal
        int     080h                    ; ask kernel to take over



	; A subroutine to print a LF, all registers are preserved
prt_lf:
		push	eax
		push	ebx
		push	ecx
		push	edx

	        mov     eax, SYSCALL_WRITE      ; write message
	        mov     ebx, STDOUT
	        mov     ecx, lf
	        mov     edx, 1			; LF is a single character
	        int     080h

		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		ret
	 