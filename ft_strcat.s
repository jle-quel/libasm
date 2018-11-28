;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TEXT 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text
	global _ft_strcat

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CORE 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_ft_strcat:
	push rbp
	mov rbp, rsp

	mov rax, rdi

	cmp rdi, 0x0
	je end
	cmp rsi, 0x0
	je end

iter_s1:
	cmp byte[rdi], 0x0
	je iter_s2

	inc rdi
	jmp iter_s1

iter_s2:
	cmp byte[rsi], 0x0
	je eof

	mov r9, [rsi]
	mov [rdi], r9 

	inc rsi
	inc rdi
	jmp iter_s2

eof:
	mov byte[rdi], 0x0

end:
	mov rdi, rax

	leave
	ret