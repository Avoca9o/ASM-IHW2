	.file	"find_substring.c"
	.text
	.p2align 4
	.globl	find_substring
	.type	find_substring, @function
find_substring:
.LFB23:
	.cfi_startproc
	endbr64
	subl	%esi, %edi
	testl	%edi, %edi
	jle	.L9
	leaq	S(%rip), %rdx
	xorl	%r10d, %r10d
	leal	1(%rsi), %r9d
	leaq	-1+EX(%rip), %rcx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$1, %eax
	xorl	%r8d, %r8d
	testl	%esi, %esi
	jg	.L5
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L13:
	movl	%eax, %r8d
	addq	$1, %rax
	cmpq	%r9, %rax
	je	.L7
.L5:
	movzbl	(%rcx,%rax), %r11d
	cmpb	%r11b, -1(%rax,%rdx)
	je	.L13
	addl	$1, %r10d
	addq	$1, %rdx
	cmpl	%r10d, %edi
	jne	.L3
.L9:
	movl	$-1, %r10d
.L1:
	movl	%r10d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	cmpl	%r8d, %esi
	je	.L1
	addl	$1, %r10d
	addq	$1, %rdx
	cmpl	%r10d, %edi
	jne	.L3
	jmp	.L9
	.cfi_endproc
.LFE23:
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
