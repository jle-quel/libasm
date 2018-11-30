;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; DATA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TEXT	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section	.text
	global start
	global _main
	extern _printf
	extern _malloc
	extern _free
	extern _bzero
	extern _memset

	extern _ft_memcpy
	extern _memcpy

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CORE	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

start:
	call _main

_main:
	enter	0x0, 0x0

.malloc:
	; malloc(size_t size);
	mov		rdi, 0xa
	call	_malloc
	mov		r12, rax

	mov		rdi, 0x14
	call	_malloc
	mov		r13, rax

.bzero:
	; bzero(void *s, size_t n);
	mov		rdi, r12
	mov		rsi, 0xa
	call	_bzero

	mov		rdi, r13
	mov		rsi, 0xa
	call	_bzero

.memset:
	; memset(void *b, int c, size_t len);
	mov		rdi, r12
	mov		rsi, 0x41
	mov		rdx, 0x9
	call	_memset

	mov		rdi, r13
	mov		rsi, 0x42
	mov		rdx, 0x9
	call	_memset

.memcpy:
	; memcpy(void *restrict dst, const void *restrict src, size_t n);
	mov		rdi, r12
	mov		rsi, r13
	mov		rdx, 0x9
	call	_ft_memcpy

.printf:
	mov		rdi, r12
	call	_printf

.free:
	; free(void *ptr);
	mov		rdi, r12
	call	_free

	mov		rdi, r13
	call	_free

_end:
	mov		rax, 0x0
	leave
	ret