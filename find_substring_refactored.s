	.file	"find_substringr.c"
	.intel_syntax noprefix
	.text
	.globl	find_substring
	.type	find_substring, @function
find_substring:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r14				# выделение регистров процессора r12-r14 и rbx
	push	r13
	push	r12
	push	rbx
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	mov	DWORD PTR -36[rbp], edi
	mov	DWORD PTR -40[rbp], esi
	mov	eax, DWORD PTR -36[rbp]
	sub	eax, DWORD PTR -40[rbp]
	mov	r14d, eax			# переменная diff в r14d, а не в rbp, как в файле find_substring.s
	mov	r12d, 0				# переменная i в r12d, а не в rbp
	jmp	.L2
.L9:
	mov	r13d, 0				# счетчик с в r13d, а не в rbp
	mov	ebx, 0		
	jmp	.L3	
.L6:
	lea	eax, [r12+rbx]
	cdqe
	lea	rdx, S[rip]
	movzx	edx, BYTE PTR [rax+rdx]
	movsx	rax, ebx
	lea	rcx, EX[rip]
	movzx	eax, BYTE PTR [rax+rcx]
	cmp	dl, al
	jne	.L10
	add	r13d, 1
	add	ebx, 1
.L3:
	cmp	ebx, DWORD PTR -40[rbp]
	jl	.L6
	jmp	.L5
.L10:
	nop
.L5:
	cmp	r13d, DWORD PTR -40[rbp]	# операции с регистрами процессора
	jne	.L7
	mov	eax, r12d			# операции с регистрами процессора
	jmp	.L8
.L7:
	add	r12d, 1				# операции с регистрами процессора
.L2:
	cmp	r12d, r14d			# операции с регистрами процессора
	jl	.L9
	mov	eax, -1
.L8:
	pop	rbx				# освобождение регистров процессора.
	pop	r12
	pop	r13
	pop	r14
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	find_substring, .-find_substring
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
