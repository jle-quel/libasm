;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SECTION TEXT 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text
	global _ft_isprint

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PUBLIC FUNCTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_ft_isprint:
	push	rbp
	mov		rbp, rsp
	
	mov		rax, 0x0

.comp:
	cmp		rdi, 0x20
	jl		.false

	cmp		rdi, 0x7e
	jle		.true

	jmp		.end

.false:
	mov		rax, 0x0
	jmp		.end

.true:
	mov		rax, 0x1

.end:
	leave
	ret