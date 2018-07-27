;; Name: Pearl Pongsuppat
;; E-mail: ppongs1@umbc.edu
;; Date: March 26, 2018
;; File: psrt_dec.asm
	
%define STDIN			0
%define STDOUT			1
%define SYSCALL_EXIT	1
%define SYSCALL_READ	3
%define SYSCALL_WRITE	4
%define BUFLEN			256

	SECTION .bss

num_1:	 	resb 32
num_2:		resb 32

	SECTION .text

	global prt_dec

prt_dec:
	;; Push 4 bytes into each of the registers

		push 	eax	
		push 	ebx	
		push 	ecx	
		push 	edx 	
		push 	edi	
		push 	esi 	

	;; Initialize registers

		mov	eax, 0
		mov 	ebx, 0
		mov 	ecx, 0
		mov 	edx, 0
		mov 	edx, 0		;Using edx for div with eax


		mov     ebx, 10         ; 10 is the divisor
					;  program to divide EDX:EAX
	
		mov     eax, [esp + 28] ; get the number we want to divide by.
					 ; and adding 28 to esp to get to the parameter
	
		mov	edi, num_1 	; Stores the value 



divide:
			div 	ebx     ; Divides EDX:EAX

			add 	edx, 48	; Converts into ASCII character 
					; ASCII value for zero 

			mov 	[num_1 + ecx], edx

			inc 	ecx    ; increments the counter 
			mov 	edx, 0 ; clear the remainder for next divide

			cmp 	eax, 0 ; Checks if the dividend is zero
			je 	check_back

			jmp divide

check_back:
			mov 	eax, [num_1 + ecx - 1]
			mov 	[num_2 + edx], eax
			dec 	ecx ; Decrements the counter
			inc 	edx 
			cmp 	ecx, 0
			je 	print
			jmp 	check_back

print:
			mov	eax, SYSCALL_WRITE
			mov 	ebx, STDOUT
			mov 	ecx, num_2
			int 	080h

pop_back:
			pop	esi
			pop 	edi
			pop	edx
			pop 	ecx
			pop 	ebx
			pop 	eax

			ret

	