%define STDERR 2
%define WRITE 4
%define SYSCALL(n) 0x2000000 | n

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SECTION TEXT	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section	.text
	global _ft_putendl

	extern _ft_putchar
	extern _ft_strlen

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PUBLIC FUNCTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_ft_putendl:
	push	rbp
	mov		rbp, rsp

backup:
	push	r12
	push	r13

	mov		r12, rdi
	mov		r13, rsi

write:
	call	_ft_strlen

	mov		rdi, r13
	mov		rsi, r12 
	mov		rdx, rax

	mov		rax, SYSCALL(WRITE)
	syscall
	jc		.end

.newline:
	mov		rdi, 0xa
	mov		rsi, r13
	call	_ft_putchar

.end:
	pop		r13
	pop		r12

	leave
	ret