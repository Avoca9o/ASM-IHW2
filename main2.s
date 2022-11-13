	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	S
	.bss
	.align 32
	.type	S, @object
	.size	S, 1000000
S:
	.zero	1000000
	.globl	EX
	.align 32
	.type	EX, @object
	.size	EX, 1000
EX:
	.zero	1000
	.section	.rodata
.LC0:
	.string	"w"
.LC1:
	.string	"random_input.txt"
	.align 8
.LC2:
	.string	"Random input was generated and is in file \"random_input.txt\""
	.align 8
.LC3:
	.string	"Random substring was generated: "
.LC4:
	.string	"random_output.txt"
	.align 8
.LC5:
	.string	"The result is in file \"random_output.txt\""
	.align 8
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
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 88
	mov	DWORD PTR -84[rbp], edi
	mov	QWORD PTR -96[rbp], rsi
	cmp	DWORD PTR -84[rbp], 1
	jne	.L2
	lea	rax, .LC0[rip]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -36[rbp], 1000000
	mov	DWORD PTR -48[rbp], 0
	jmp	.L3
.L4:
	call	rand@PLT
	movsx	rbx, eax
	call	clock@PLT
	add	rax, rbx
	cqo
	shr	rdx, 59
	add	rax, rdx
	and	eax, 31
	sub	rax, rdx
	add	eax, 32
	mov	ecx, eax
	mov	eax, DWORD PTR -48[rbp]
	cdqe
	lea	rdx, S[rip]
	mov	BYTE PTR [rax+rdx], cl
	mov	eax, DWORD PTR -48[rbp]
	cdqe
	lea	rdx, S[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	movsx	eax, al
	mov	rdx, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	fputc@PLT
	add	DWORD PTR -48[rbp], 1
.L3:
	mov	eax, DWORD PTR -48[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L4
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	call	rand@PLT
	movsx	rbx, eax
	call	clock@PLT
	lea	rcx, [rbx+rax]
	movabs	rdx, 7378697629483820647
	mov	rax, rcx
	imul	rdx
	mov	rax, rdx
	sar	rax
	mov	rdx, rcx
	sar	rdx, 63
	sub	rax, rdx
	mov	rdx, rax
	sal	rdx, 2
	add	rdx, rax
	mov	rax, rcx
	sub	rax, rdx
	add	eax, 1
	mov	DWORD PTR -40[rbp], eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -48[rbp], 0
	jmp	.L5
.L6:
	call	rand@PLT
	movsx	rbx, eax
	call	clock@PLT
	add	rax, rbx
	cqo
	shr	rdx, 59
	add	rax, rdx
	and	eax, 31
	sub	rax, rdx
	add	eax, 32
	mov	ecx, eax
	mov	eax, DWORD PTR -48[rbp]
	cdqe
	lea	rdx, EX[rip]
	mov	BYTE PTR [rax+rdx], cl
	mov	eax, DWORD PTR -48[rbp]
	cdqe
	lea	rdx, EX[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT
	add	DWORD PTR -48[rbp], 1
.L5:
	mov	eax, DWORD PTR -48[rbp]
	cmp	eax, DWORD PTR -40[rbp]
	jl	.L6
	mov	edi, 10
	call	putchar@PLT
	lea	rax, .LC0[rip]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L7
.L2:
	cmp	DWORD PTR -84[rbp], 999
	jle	.L8
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L9
.L8:
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC7[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	jne	.L10
	lea	rax, .LC8[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L9
.L10:
	lea	rax, .LC0[rip]
	mov	rsi, rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -48[rbp], 2
	jmp	.L11
.L16:
	mov	eax, DWORD PTR -48[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -96[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	strlen@PLT
	mov	DWORD PTR -56[rbp], eax
	mov	DWORD PTR -52[rbp], 0
	jmp	.L12
.L14:
	cmp	DWORD PTR -40[rbp], 1000
	jne	.L13
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L9
.L13:
	mov	eax, DWORD PTR -48[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -96[rbp]
	add	rax, rdx
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	lea	rcx, EX[rip]
	mov	BYTE PTR [rax+rcx], dl
	add	DWORD PTR -40[rbp], 1
	add	DWORD PTR -52[rbp], 1
.L12:
	mov	eax, DWORD PTR -52[rbp]
	cmp	eax, DWORD PTR -56[rbp]
	jl	.L14
	cmp	DWORD PTR -40[rbp], 999
	jg	.L15
	mov	eax, DWORD PTR -84[rbp]
	sub	eax, 1
	cmp	DWORD PTR -48[rbp], eax
	je	.L15
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	lea	rdx, EX[rip]
	mov	BYTE PTR [rax+rdx], 32
	add	DWORD PTR -40[rbp], 1
.L15:
	add	DWORD PTR -48[rbp], 1
.L11:
	mov	eax, DWORD PTR -48[rbp]
	cmp	eax, DWORD PTR -84[rbp]
	jl	.L16
	mov	DWORD PTR -36[rbp], 0
	jmp	.L17
.L18:
	mov	eax, DWORD PTR -52[rbp]
	mov	ecx, eax
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, S[rip]
	mov	BYTE PTR [rax+rdx], cl
	add	DWORD PTR -36[rbp], 1
	cmp	DWORD PTR -36[rbp], 1000000
	jne	.L17
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L9
.L17:
	cmp	DWORD PTR -36[rbp], 999999
	jg	.L7
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -52[rbp], eax
	cmp	DWORD PTR -52[rbp], -1
	jne	.L18
.L7:
	call	clock@PLT
	mov	QWORD PTR -64[rbp], rax
	mov	DWORD PTR -48[rbp], 0
	jmp	.L19
.L20:
	mov	edx, DWORD PTR -40[rbp]
	mov	eax, DWORD PTR -36[rbp]
	mov	esi, edx
	mov	edi, eax
	call	find_substring@PLT
	mov	DWORD PTR -44[rbp], eax
	add	DWORD PTR -48[rbp], 1
.L19:
	cmp	DWORD PTR -48[rbp], 999
	jle	.L20
	call	clock@PLT
	mov	QWORD PTR -72[rbp], rax
	mov	edx, DWORD PTR -44[rbp]
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC11[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -72[rbp]
	sub	rax, QWORD PTR -64[rbp]
	mov	rcx, rax
	movabs	rdx, 2361183241434822607
	mov	rax, rcx
	imul	rdx
	mov	rax, rdx
	sar	rax, 7
	sar	rcx, 63
	mov	rdx, rcx
	sub	rax, rdx
	mov	rsi, rax
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
.L9:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	main, .-main
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
