;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SECTION TEXT	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section	.text
	global _ft_strdup
	extern _ft_strlen
	extern _swap
	extern _malloc
	extern _bzero

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PUBLIC FUNCTION 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_ft_strdup:
	push	rbp
	mov		rbp, rsp

.backup:
	mov		r12, rdi

.check:
	cmp		rdi, 0x0
	je		.err

.strlen:
	call	_ft_strlen
	mov		r13, rax

.malloc:
	mov		rdi, r13
	add		rdi, 1
	call	_malloc
	mov		r14, rax

	cmp		rax, 0x0
	je		.err

.memcpy:
	mov		rsi, r12
	mov		rcx, r13
	mov		rdi, r14

	rep		movsb

	mov		byte[rdi], 0x0

	jmp		.end

.err:
	mov		rax, 0x0

	leave
	ret

.end:
	mov		rax, r14

	leave
	ret