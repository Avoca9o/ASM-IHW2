	.file	"find_substring.c"
	.text
	.globl	find_substring
	.type	find_substring, @function
find_substring:
.LFB13:
	.cfi_startproc
	endbr64
	subl	%esi, %edi
	xorl	%edx, %edx
	leaq	S(%rip), %rcx
	leaq	-1+EX(%rip), %r9
.L2:
	movl	%edx, %r8d
	cmpl	%edx, %edi
	jle	.L9
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %r11
.L6:
	cmpl	%eax, %esi
	jle	.L10
	movb	(%r11,%rax), %r10b
	incq	%rax
	cmpb	(%rax,%r9), %r10b
	je	.L6
	jmp	.L3
.L10:
	cmpl	%esi, %eax
	je	.L1
.L3:
	incq	%rdx
	jmp	.L2
.L9:
	orl	$-1, %r8d
.L1:
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE13:
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
