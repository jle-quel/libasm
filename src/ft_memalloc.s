;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SECTION TEXT	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text
	global _ft_memalloc

	extern _ft_bzero
	extern _malloc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PUBLIC FUNCTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_ft_memalloc:
	push	rbp
	mov		rbp, rsp

.check:
	cmp		rdi, 0x0
	je		.err

.backup:
	mov		r12, rdi

.malloc:
	call	_malloc
	
	cmp		rax, 0x0
	je		.err

	mov		r13, rax

.bzero:
	mov		rdi, r13
	mov		rsi, r12
	call	_ft_bzero

	jmp		.end

.err:
	mov		rax, 0x0

	leave
	ret

.end:
	mov		rax, r13

	leave
	ret
