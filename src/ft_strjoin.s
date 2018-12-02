;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SECTION TEXT 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text
	global _ft_strjoin

	extern _ft_strdup
	extern _ft_strlen
	extern _ft_memalloc
	extern _ft_memcpy

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PUBLIC FUNCTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_ft_strjoin:
	push	rbp
	mov		rbp, rsp

.check:
	cmp		rdi, 0x0
	je		.strdup1

	cmp		rsi, 0x0
	je		.strdup2

.backup:
	mov		rbx, rdi ; s1
	mov		rsp, rsi ; s2

.strlen:
	mov		rdi, rbx
	; call	_strlen
	; mov		r12, rax ; len s1

	mov		rdi, rsp
	; call	_ft_strlen
	; mov		r13, rax ; len s2

	mov		rax, 0x0
	jmp		.end

; .malloc:
	; mov		r8, rdi
	; add		r8, r13
	; mov		rdi, dword[r12 + r13]
	; call	_ft_memalloc

	; cmp		rax, 0x0
	; je		.end

	; mov		r14, rax ; ptr

; .memcpy:
	; mov		rdi, r14
	; mov		rsi, rbx
	; mov		rdx, r12

	; call	_ft_memcpy

	; cmp		rax, 0x0
	; je		.end

	; add		rax, r12

	; mov		rdi, rax
	; mov		rsi, rsp
	; mov		rdx, r13

	; call	_ft_memcpy

	; cmp		rax, 0x0
	; je		.end

	; mov		rax, r14

	; jmp		.end

.strdup1:
	mov		rdi, rsi
	call	_ft_strdup

	jmp		.end

.strdup2:
	call	_ft_strdup

.end:
	leave
	ret