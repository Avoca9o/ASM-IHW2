	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"w"
.LC1:
	.string	"random_input.txt"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Random input was generated and is in file \"random_input.txt\""
	.align 8
.LC3:
	.string	"Random substring was generated: "
	.section	.rodata.str1.1
.LC4:
	.string	"random_output.txt"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"The result is in file \"random_output.txt\""
	.align 8
.LC6:
	.string	"size of string to find is too big"
	.section	.rodata.str1.1
.LC7:
	.string	"r"
.LC8:
	.string	"Wrong filename"
.LC9:
	.string	"output.txt"
.LC10:
	.string	"size of input is too big"
.LC11:
	.string	"%d"
.LC12:
	.string	"Working time: %ld ms\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$1, %edi
	je	.L36
	movl	%edi, %r12d
	cmpl	$999, %edi
	jg	.L15
	movq	8(%rsi), %rdi
	movq	%rsi, %r15
	leaq	.LC7(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L37
	leaq	.LC0(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	call	fopen@PLT
	movq	%rax, (%rsp)
	cmpl	$2, %r12d
	jle	.L11
	leal	-1(%r12), %eax
	addq	$16, %r15
	movl	$2, %r14d
	movl	%eax, 12(%rsp)
.L18:
	movq	(%r15), %r13
	movq	%r13, %rdi
	call	strlen@PLT
	testl	%eax, %eax
	jle	.L12
	cmpl	$1000, %ebx
	je	.L15
	movslq	%ebx, %rdi
	leaq	EX(%rip), %rdx
	leal	(%rbx,%rax), %ecx
	xorl	%eax, %eax
	addq	%rdx, %rdi
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L16:
	addq	$1, %rax
	cmpl	$1000, %ebx
	je	.L15
	movq	(%r15), %r13
.L14:
	movzbl	0(%r13,%rax), %edx
	addl	$1, %ebx
	movb	%dl, (%rdi,%rax)
	cmpl	%ecx, %ebx
	jne	.L16
.L12:
	cmpl	$999, %ebx
	jg	.L17
	cmpl	%r14d, 12(%rsp)
	je	.L17
	movslq	%ebx, %rax
	leaq	EX(%rip), %rdx
	addl	$1, %ebx
	movb	$32, (%rdx,%rax)
.L17:
	addl	$1, %r14d
	addq	$8, %r15
	cmpl	%r14d, %r12d
	jne	.L18
.L11:
	leaq	S(%rip), %r12
	leaq	1000000(%r12), %r13
	movq	%r12, %r15
	.p2align 4,,10
	.p2align 3
.L19:
	movl	%r15d, %r14d
	movq	%rbp, %rdi
	subl	%r12d, %r14d
	call	fgetc@PLT
	cmpl	$-1, %eax
	je	.L5
	movb	%al, (%r15)
	addq	$1, %r15
	cmpq	%r13, %r15
	jne	.L19
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L1
	.p2align 4,,10
	.p2align 3
.L15:
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
.L1:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L36:
	.cfi_restore_state
	leaq	.LC0(%rip), %r12
	leaq	.LC1(%rip), %rdi
	movq	%r12, %rsi
	leaq	S(%rip), %rbx
	call	fopen@PLT
	leaq	1000000(%rbx), %r13
	movq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	call	rand@PLT
	addq	$1, %rbx
	movl	%eax, %r14d
	call	clock@PLT
	movslq	%r14d, %rdi
	movq	%rbp, %rsi
	addq	%rax, %rdi
	movq	%rdi, %rax
	sarq	$63, %rax
	shrq	$59, %rax
	addq	%rax, %rdi
	andl	$31, %edi
	subq	%rax, %rdi
	addl	$32, %edi
	movb	%dil, -1(%rbx)
	movzbl	%dil, %edi
	call	fputc@PLT
	cmpq	%r13, %rbx
	jne	.L3
	leaq	.LC2(%rip), %rdi
	leaq	EX(%rip), %r13
	call	puts@PLT
	call	rand@PLT
	movl	%eax, %ebx
	call	clock@PLT
	movl	$5, %ecx
	movl	$1, %edi
	leaq	.LC3(%rip), %rsi
	movq	%rax, %r8
	movslq	%ebx, %rax
	addq	%r8, %rax
	cqto
	idivq	%rcx
	xorl	%eax, %eax
	movq	%rdx, %r14
	leal	1(%rdx), %ebx
	call	__printf_chk@PLT
	movl	%r14d, %eax
	leaq	1(%r13), %r14
	addq	%rax, %r14
	testl	%ebx, %ebx
	jle	.L7
	.p2align 4,,10
	.p2align 3
.L6:
	call	rand@PLT
	addq	$1, %r13
	movl	%eax, %r15d
	call	clock@PLT
	movq	%rax, %r8
	movslq	%r15d, %rax
	addq	%r8, %rax
	cqto
	shrq	$59, %rdx
	leaq	(%rax,%rdx), %rdi
	andl	$31, %edi
	subq	%rdx, %rdi
	addl	$32, %edi
	movb	%dil, -1(%r13)
	movzbl	%dil, %edi
	call	putchar@PLT
	cmpq	%r13, %r14
	jne	.L6
.L7:
	movl	$10, %edi
	movl	$1000000, %r14d
	call	putchar@PLT
	movq	%r12, %rsi
	leaq	.LC4(%rip), %rdi
	call	fopen@PLT
	leaq	.LC5(%rip), %rdi
	movq	%rax, (%rsp)
	call	puts@PLT
.L5:
	call	clock@PLT
	movl	$1000, %r12d
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L21:
	movl	%ebx, %esi
	movl	%r14d, %edi
	call	find_substring@PLT
	subl	$1, %r12d
	jne	.L21
	movl	%eax, 12(%rsp)
	call	clock@PLT
	movq	(%rsp), %r14
	movl	12(%rsp), %ecx
	leaq	.LC11(%rip), %rdx
	movl	$1, %esi
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	%r14, %rdi
	call	__fprintf_chk@PLT
	movq	%r14, %rdi
	call	fclose@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	movq	%rbx, %rax
	movl	$1000, %ecx
	leaq	.LC12(%rip), %rsi
	subq	%r15, %rax
	movl	$1, %edi
	cqto
	idivq	%rcx
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	jmp	.L1
.L37:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L1
	.cfi_endproc
.LFE51:
	.size	main, .-main
	.globl	EX
	.bss
	.align 32
	.type	EX, @object
	.size	EX, 1000
EX:
	.zero	1000
	.globl	S
	.align 32
	.type	S, @object
	.size	S, 1000000
S:
	.zero	1000000
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
