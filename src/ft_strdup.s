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
	push	r12
	mov		r12, rdi

.check:
	cmp		rdi, 0x0
	je		.null

.strlen:
	call	_ft_strlen
	push	r13
	mov		r13, rax

.malloc:
	mov		rdi, r13
	add		rdi, 1
	call	_malloc
	push	r14
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

.null:
	pop		r12
	mov		rax, 0x0

	leave
	ret

.err:
	mov		rax, 0x0

	leave
	ret

.end:
	mov		rax, r14

	pop		r14
	pop		r13
	pop		r12

	leave
	ret
