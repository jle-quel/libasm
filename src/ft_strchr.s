;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SECTION TEXT 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text
	global _ft_strchr

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PUBLIC FUNCTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; char *ft_strchr(const char *s, int c);

_ft_strchr:
	push	rbp
	mov		rbp, rsp

	cmp		rdi, 0x0
	je		.end

.iter:
	cmp		byte[rdi], 0x0
	je		.check

	mov		rax, rsi
	cmp		byte[rdi], al 
	je		.end

	inc		rdi

	jmp		.iter

.check:
	cmp		rsi, 0x0
	jne		.null

	jmp		.end

.null:
	mov		rax, 0x0

	leave
	ret

.end:
	mov		rax, rdi

	leave
	ret