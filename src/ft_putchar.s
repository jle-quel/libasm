%define STDOUT 1
%define WRITE 4
%define SYSCALL(n) 0x2000000 | n

section	.text
	global _ft_putchar

	extern _printf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PUBLIC FUNCTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_ft_putchar:
	push	rbp
	mov		rbp, rsp

.backup:
	push	r12
	mov		r12, rsi

.init:
	sub		rsp, 8

.write:
	push	rdi

	mov		rdi, r12
	mov		rsi, rsp
	mov		rdx, 1
	mov		rax, SYSCALL(WRITE)
	syscall

.resolve:
	add		rsp, 8

.end:
	pop		r12

	leave
	ret