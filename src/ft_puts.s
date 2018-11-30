%define STDOUT 1
%define WRITE 4
%define SYSCALL(n) 0x2000000 | n

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; DATA 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .data
data:
	.null db "(null)", 0x0
	.eof db 0xa

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TEXT	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section	.text
	global _ft_puts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CORE	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_ft_puts:
	mov		r8, rdi
	mov		r9, rdi
	mov		rcx, 0x0

init:
	cmp		r8, 0x0
	je		load
	jmp		iter

load:
	lea		r8, [ rel data.null ]
	jmp		iter

iter:
	cmp		byte[r8], 0x0
	je		end

	mov		rdi, STDOUT
	mov		rsi, r8
	mov		rdx, 1
	mov		rax, SYSCALL(WRITE)
	syscall
	jc		err

	inc		r8
	jmp		iter

end:
	mov		rdi, STDOUT
	lea		rsi, [ rel data.eof ]
	mov		rdx, 1
	mov		rax, SYSCALL(WRITE)
	syscall
	jc		err

	mov		rdi, r9
	mov		rax, 10

	ret

err:
	mov		rdi, r9
	mov		rax, -1

	ret