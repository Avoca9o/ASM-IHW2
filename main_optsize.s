	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"w"
.LC1:
	.string	"random_input.txt"
.LC2:
	.string	"Random input was generated and is in file \"random_input.txt\""
.LC3:
	.string	"Random substring was generated: "
.LC4:
	.string	"random_output.txt"
.LC5:
	.string	"The result is in file \"random_output.txt\""
.LC6:
	.string	"size of string to find is too big"
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
	.globl	main
	.type	main, @function
main:
.LFB36:
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
	jne	.L2
	leaq	.LC0(%rip), %r12
	leaq	.LC1(%rip), %rdi
	movl	$32, %r13d
	movq	%r12, %rsi
	leaq	S(%rip), %rbx
	call	fopen@PLT
	leaq	1000000(%rbx), %r14
	movq	%rax, %rbp
.L3:
	call	rand@PLT
	incq	%rbx
	movl	%eax, %r15d
	call	clock@PLT
	movq	%rbp, %rsi
	movq	%rax, %r8
	movslq	%r15d, %rax
	addq	%r8, %rax
	cqto
	idivq	%r13
	addl	$32, %edx
	movb	%dl, -1(%rbx)
	movzbl	%dl, %edi
	call	fputc@PLT
	cmpq	%r14, %rbx
	jne	.L3
	leaq	.LC2(%rip), %rdi
	leaq	EX(%rip), %r14
	call	puts@PLT
	movq	%r14, %r13
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
	leal	1(%rdx), %ebx
	call	__printf_chk@PLT
.L4:
	movl	%r13d, %eax
	subl	%r14d, %eax
	cmpl	%eax, %ebx
	jle	.L27
	call	rand@PLT
	incq	%r13
	movl	%eax, %r15d
	call	clock@PLT
	movl	$32, %ecx
	movq	%rax, %r8
	movslq	%r15d, %rax
	addq	%r8, %rax
	cqto
	idivq	%rcx
	addl	$32, %edx
	movb	%dl, -1(%r13)
	movzbl	%dl, %edi
	call	putchar@PLT
	jmp	.L4
.L27:
	movl	$10, %edi
	movl	$1000000, %r14d
	call	putchar@PLT
	movq	%r12, %rsi
	leaq	.LC4(%rip), %rdi
	call	fopen@PLT
	leaq	.LC5(%rip), %rdi
	movq	%rax, %r13
	call	puts@PLT
	jmp	.L6
.L2:
	movl	%edi, %r12d
	cmpl	$999, %edi
	jle	.L7
.L12:
	leaq	.LC6(%rip), %rdi
	jmp	.L25
.L7:
	movq	8(%rsi), %rdi
	movq	%rsi, %r15
	leaq	.LC7(%rip), %rsi
	call	fopen@PLT
	leaq	.LC8(%rip), %rdi
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L25
	leaq	.LC0(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	movl	$2, %r14d
	call	fopen@PLT
	movq	%rax, %r13
	leal	-1(%r12), %eax
	movl	%eax, 12(%rsp)
.L10:
	movl	%r14d, 8(%rsp)
	cmpl	%r14d, %r12d
	jle	.L28
	movq	(%r15,%r14,8), %rdi
	call	strlen@PLT
	movslq	%ebx, %rsi
	xorl	%edi, %edi
	leaq	EX(%rip), %r8
.L11:
	movl	%esi, %ebx
	cmpl	%edi, %eax
	jle	.L29
	cmpl	$1000, %esi
	je	.L12
	movq	(%r15,%r14,8), %r9
	movb	(%r9,%rdi), %r9b
	incq	%rdi
	movb	%r9b, (%r8,%rsi)
	incq	%rsi
	jmp	.L11
.L29:
	cmpl	$999, %esi
	jg	.L14
	movl	8(%rsp), %ecx
	cmpl	%ecx, 12(%rsp)
	je	.L14
	movslq	%esi, %rax
	incl	%ebx
	movb	$32, (%r8,%rax)
.L14:
	incq	%r14
	jmp	.L10
.L28:
	leaq	S(%rip), %r15
	movq	%r15, %r12
.L17:
	movl	%r12d, %r14d
	movq	%rbp, %rdi
	subl	%r15d, %r14d
	call	fgetc@PLT
	cmpl	$-1, %eax
	je	.L6
	movb	%al, (%r12)
	incq	%r12
	leaq	1000000+S(%rip), %rax
	cmpq	%rax, %r12
	jne	.L17
	leaq	.LC10(%rip), %rdi
.L25:
	call	puts@PLT
	movl	$1, %eax
	jmp	.L1
.L6:
	call	clock@PLT
	movl	$1000, %edx
	movq	%rax, %r12
.L19:
	movl	%ebx, %esi
	movl	%r14d, %edi
	movl	%edx, 8(%rsp)
	call	find_substring@PLT
	movl	8(%rsp), %edx
	movl	%eax, %r15d
	decl	%edx
	jne	.L19
	call	clock@PLT
	movl	%r15d, %ecx
	movl	$1, %esi
	movq	%r13, %rdi
	leaq	.LC11(%rip), %rdx
	movq	%rax, %rbx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	%r13, %rdi
	call	fclose@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	movq	%rbx, %rax
	movl	$1000, %ecx
	leaq	.LC12(%rip), %rsi
	subq	%r12, %rax
	movl	$1, %edi
	cqto
	idivq	%rcx
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
.L1:
	addq	$24, %rsp
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
	.cfi_endproc
.LFE36:
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
