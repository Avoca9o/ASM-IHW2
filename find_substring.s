	.file	"find_substring.c"
	.intel_syntax noprefix
	.text
	.globl	find_substring				# объявление функции
	.type	find_substring, @function
find_substring:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp					# пролог функции
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -20[rbp], edi			# считываем параметр sizeOfS из edi, куда мы его положили в функции main
	mov	DWORD PTR -24[rbp], esi			# считываем параметр sizeOFEx из esi, куда мы его положили в функции main
	mov	eax, DWORD PTR -20[rbp]
	sub	eax, DWORD PTR -24[rbp]			# sizeOfS - sizeOfEx
	mov	DWORD PTR -4[rbp], eax			# diff = sizeOfS - sizeOfEx
	mov	DWORD PTR -12[rbp], 0			# i = 0, начало цикла
	jmp	.L2
.L9:
	mov	DWORD PTR -16[rbp], 0			# c = 0 - счетчик 
	mov	DWORD PTR -8[rbp], 0			# j = 0, начало цикла
	jmp	.L3
.L6:
	mov	edx, DWORD PTR -12[rbp]			# i
	mov	eax, DWORD PTR -8[rbp]			# j
	add	eax, edx				# i + j
	cdqe
	lea	rdx, S[rip]				# S[i + j]
	movzx	edx, BYTE PTR [rax+rdx]	
	mov	eax, DWORD PTR -8[rbp]			# j
	cdqe
	lea	rcx, EX[rip]				# EX[j]
	movzx	eax, BYTE PTR [rax+rcx]
	cmp	dl, al					# if (S[i + j] != EX[j])
	jne	.L10
	add	DWORD PTR -16[rbp], 1			# ++c
	add	DWORD PTR -8[rbp], 1			# ++j
.L3:
	mov	eax, DWORD PTR -8[rbp]			# j
	cmp	eax, DWORD PTR -24[rbp]			# sizeOfEx
	jl	.L6					# if j < sizeOfEx
	jmp	.L5
.L10:
	nop						# break;
.L5:
	mov	eax, DWORD PTR -16[rbp]			# c
	cmp	eax, DWORD PTR -24[rbp]			# if (c == sizeOfEx)
	jne	.L7
	mov	eax, DWORD PTR -12[rbp]			# return i
	jmp	.L8
.L7:
	add	DWORD PTR -12[rbp], 1			# ++i
.L2:
	mov	eax, DWORD PTR -12[rbp]			# i
	cmp	eax, DWORD PTR -4[rbp]			# i < diff (условие цикла)
	jl	.L9
	mov	eax, -1					# return -1
.L8:
	pop	rbp					# эпилог функции find_substring
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
