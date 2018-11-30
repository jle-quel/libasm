;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SECTION TEXT	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section	.text
	global _ft_bzero

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PUBLIC FUNCTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_ft_bzero:
	push	rbp
	mov		rbp, rsp

	mov		rax, rdi
	mov		rcx, 0x0

	cmp		rdi, 0x0
	je		.end

.iter:
	cmp		rsi, rcx
	je		.end

	mov		byte[rdi], 0x0

	inc		rdi
	inc		rcx
	jmp		.iter 

.end:
	mov		rdi, rax

	leave
	ret