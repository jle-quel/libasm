;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TEXT 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text
	global _ft_isalnum

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CORE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_ft_isalnum:
	mov		rax, 0x0

comp:
	cmp		rdi, 0x30
	jl		false

	cmp		rdi, 0x39
	jle		true

	cmp		rdi, 0x41
	jl		false

	cmp		rdi, 0x5a
	jle		true

	cmp		rdi, 0x61
	jl		false

	cmp		rdi, 0x7a
	jle		true

	jmp		end

false:
	mov		rax, 0x0
	jmp		end

true:
	mov		rax, 0x1
	jmp		end

end:
	ret