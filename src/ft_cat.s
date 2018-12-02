%define READ 3
%define WRITE 4
%define STDOUT 1
%define BUF_SIZE 4096
%define SYSCALL(n) 0x2000000 | n

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SECTION BSS 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .bss
buffer:
	.string resb 4096

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; SECTION TEXT	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text
	global _ft_cat

	extern _ft_bzero

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PUBLIC FUNCTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_ft_cat:
	push	rbp
	mov		rbp, rsp

	mov		r12, rdi

.init:
	lea		rdi, [ rel buffer.string ]
	mov		rsi, 4096
	call	_ft_bzero

.read:
	mov			rdi, r12
	lea			rsi, [ rel buffer.string ]
	mov			rdx, BUF_SIZE - 1
	mov			rax, SYSCALL(READ)
	syscall

	jc		.err
	cmp		rax, 0x0
	je		.end

.write:
	mov		rdi, STDOUT
	lea		rsi, [ rel buffer.string ]
	mov		rdx, rax
	mov		rax, SYSCALL(WRITE)
	syscall

	jc		.err

	jmp		.read

.err:
	mov		rax, -1

.end:
	leave
	ret
