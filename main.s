	.file	"main.c"			# название файла
	.intel_syntax noprefix			# выбор синтаксиса ассемблера
	.text
	.globl	S				# объявление входного массива S
	.bss
	.align 32
	.type	S, @object
	.size	S, 1000000			# Выделение памяти для массива S
S:
	.zero	1000000
	.globl	EX				# 
	.align 32
	.type	EX, @object
	.size	EX, 1000			# выделение памяти для массива EX 1000 символов
EX:
	.zero	1000
	.section	.rodata			# много секций со строками, которые могут использоваться в программе
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
main:							# объявление функции main
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp					# пролог функции main
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 88
	.cfi_offset 3, -24
	mov	DWORD PTR -84[rbp], edi			# копирование argc
	mov	QWORD PTR -96[rbp], rsi			# копирование argv
	cmp	DWORD PTR -84[rbp], 1			# argc == 1
	jne	.L2					# входим в первую ветку усл. оператора
	lea	rax, .LC0[rip]				# берем строку "random_input.txt"
	mov	rsi, rax
	lea	rax, .LC1[rip]				# берем строку "w"
	mov	rdi, rax
	call	fopen@PLT				# fopen("random_input.txt", "w")
	mov	QWORD PTR -48[rbp], rax			# присваеваем открытый файл в input
	mov	DWORD PTR -72[rbp], 1000000		# sizeOfS = 1000000
	mov	DWORD PTR -60[rbp], 0			# i = 0
	jmp	.L3
.L4:
	call	rand@PLT				# вызов функции rand
	movsx	rbx, eax				
	call	clock@PLT				# вызов функции clock
	add	rax, rbx				# складываем rand и clock
	cqo
	shr	rdx, 59					# полученный результат % 32
	add	rax, rdx
	and	eax, 31
	sub	rax, rdx
	add	eax, 32					# прибавляем 32
	mov	ecx, eax				# каст к симольному типу
	mov	eax, DWORD PTR -60[rbp]			# присваиваем получ. значение S[i]
	cdqe
	lea	rdx, S[rip]
	mov	BYTE PTR [rax+rdx], cl
	mov	eax, DWORD PTR -60[rbp]			
	cdqe
	lea	rdx, S[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	movsx	eax, al
	mov	rdx, QWORD PTR -48[rbp]			# копирование символа для записи в файл
	mov	rsi, rdx
	mov	edi, eax
	call	fputc@PLT				# записываем символ S[i] в файл
	add	DWORD PTR -60[rbp], 1			# ++i
.L3:
	mov	eax, DWORD PTR -60[rbp]
	cmp	eax, DWORD PTR -72[rbp]			# сравнение i и sizeOfS
	jl	.L4
	lea	rax, .LC2[rip]				# берем надпись "Random input was..."
	mov	rdi, rax
	call	puts@PLT				# выводим ее в консоль
	call	rand@PLT				# генерируем рандомное значение
	movsx	rbx, eax
	call	clock@PLT				# вызываем функцию clock
	lea	rcx, [rbx+rax]				# записываем получившееся значение во временный регистр
	movabs	rdx, 7378697629483820647		# % 5
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
	add	eax, 1					# добавляем 1, чтоб не генерировалось пустых строк
	mov	DWORD PTR -68[rbp], eax			# присваиваем sizeOfEx получ. значение
	lea	rax, .LC3[rip]				# берем строку "Random substing was generated"
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT				# выводим ее в консоль
	mov	DWORD PTR -60[rbp], 0			# i = 0, начало цикла
	jmp	.L5
.L6:
	call	rand@PLT				# генерация рандомного значения
	movsx	rbx, eax
	call	clock@PLT				# вызов функции clock()
	add	rax, rbx				# сложение rand и clock
	cqo
	shr	rdx, 59					# % 32
	add	rax, rdx
	and	eax, 31
	sub	rax, rdx
	add	eax, 32					# прибавляем к полученному 32
	mov	ecx, eax
	mov	eax, DWORD PTR -60[rbp]			# EX[i] = (char)((rand() + clock()) % 32 + 32)
	cdqe
	lea	rdx, EX[rip]				# взятие символа EX[i]
	mov	BYTE PTR [rax+rdx], cl
	mov	eax, DWORD PTR -60[rbp]
	cdqe
	lea	rdx, EX[rip]
	movzx	eax, BYTE PTR [rax+rdx]			# подстановка симвоал в "%c"
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT				# вывод EX[i]
	add	DWORD PTR -60[rbp], 1			# ++i
.L5:
	mov	eax, DWORD PTR -60[rbp]
	cmp	eax, DWORD PTR -68[rbp]			# сравнение i и sizeOfEx
	jl	.L6
	mov	edi, 10					# берем '\n'
	call	putchar@PLT				# выводим его в консоль
	lea	rax, .LC0[rip]				# берем строку "randou_output.txt"
	mov	rsi, rax
	lea	rax, .LC4[rip]				# берем строку "w"
	mov	rdi, rax
	call	fopen@PLT				# fopen("random_output.txt", "w");
	mov	QWORD PTR -40[rbp], rax			# output = открытый файл
	lea	rax, .LC5[rip]				# берем строку "The result is in..."
	mov	rdi, rax
	call	puts@PLT				# выводим ее в консоль
	jmp	.L7
.L2:
	cmp	DWORD PTR -84[rbp], 999			# сравниваем argc с 1000
	jle	.L8
	lea	rax, .LC6[rip]				# берем строку "size of string to find is too big\n"
	mov	rdi, rax
	call	puts@PLT				# выводим ее в консоль
	mov	eax, 1					# return 1;
	jmp	.L9
.L8:
	mov	rax, QWORD PTR -96[rbp]			# копирование argv в регистры данной функции
	add	rax, 8					# смещение argv
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC7[rip]				# берем строку "r"
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT				# открываем файл 
	mov	QWORD PTR -48[rbp], rax
	cmp	QWORD PTR -48[rbp], 0			#if ((input = fopen(argv[1], "r")) == 0)
	jne	.L10
	lea	rax, .LC8[rip]				# берем строку "Wrong filename\n"
	mov	rdi, rax
	call	puts@PLT				# выводим ее в консоль
	mov	eax, 1					# return 1;
	jmp	.L9
.L10:
	lea	rax, .LC0[rip]				# берем строку "output.txt"
	mov	rsi, rax
	lea	rax, .LC9[rip]				# берем строку "w"
	mov	rdi, rax
	call	fopen@PLT				# fopen("output.txt", "w")
	mov	QWORD PTR -40[rbp], rax			# output = открытый файл
	mov	DWORD PTR -60[rbp], 2			# i = 2, начало цикла
	jmp	.L11
.L16:
	mov	eax, DWORD PTR -60[rbp]			# i
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -96[rbp]			# argv
	add	rax, rdx				# argv[i]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	strlen@PLT				# strlen(argv[i])
	mov	DWORD PTR -52[rbp], eax			# temp = strlen(argv[i])
	mov	DWORD PTR -56[rbp], 0			# c = 0, начало цикла
	jmp	.L12
.L14:
	cmp	DWORD PTR -68[rbp], 1000		# if (sizeOfEx == 1000)
	jne	.L13
	lea	rax, .LC6[rip]				# берем строку "size of string to find is too big\n"
	mov	rdi, rax
	call	puts@PLT				# выводим ее в консоль
	mov	eax, 1					# return 1
	jmp	.L9
.L13:
	mov	eax, DWORD PTR -60[rbp]			# i
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -96[rbp]			# argv
	add	rax, rdx
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -56[rbp]			# c
	cdqe
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -68[rbp]			# sizeOfEx
	cdqe
	lea	rcx, EX[rip]
	mov	BYTE PTR [rax+rcx], dl			# EX[sizeOfEx] = argv[i][c]
	add	DWORD PTR -68[rbp], 1			# ++sizeOfEx
	add	DWORD PTR -56[rbp], 1			# ++c
.L12:
	mov	eax, DWORD PTR -56[rbp]
	cmp	eax, DWORD PTR -52[rbp]			# c < temp, проверка условия цикла
	jl	.L14
	cmp	DWORD PTR -68[rbp], 999			# sizeOfEx < 1000
	jg	.L15
	mov	eax, DWORD PTR -84[rbp]			# argc
	sub	eax, 1					# argc - 1
	cmp	DWORD PTR -60[rbp], eax			# i != argc - 1
	je	.L15
	mov	eax, DWORD PTR -68[rbp]
	cdqe
	lea	rdx, EX[rip]
	mov	BYTE PTR [rax+rdx], 32			# EX[sizeOfEx] = ' '
	add	DWORD PTR -68[rbp], 1			# ++sizeOfEx
.L15:
	add	DWORD PTR -60[rbp], 1			# ++i
.L11:
	mov	eax, DWORD PTR -60[rbp]			# i
	cmp	eax, DWORD PTR -84[rbp]			# argc
	jl	.L16
	mov	DWORD PTR -72[rbp], 0			# sizeOfS = 0
	jmp	.L17
.L18:
	mov	eax, DWORD PTR -56[rbp]			# c
	mov	ecx, eax
	mov	eax, DWORD PTR -72[rbp]			# S[sizeOfS] = (char)c
	cdqe
	lea	rdx, S[rip]
	mov	BYTE PTR [rax+rdx], cl
	add	DWORD PTR -72[rbp], 1			# ++sizeOfS
	cmp	DWORD PTR -72[rbp], 1000000		# if (sizeOfS == 1000000)
	jne	.L17
	lea	rax, .LC10[rip]				# берем строку "size of input is too big]n"
	mov	rdi, rax
	call	puts@PLT				# выводим ее в консоль
	mov	eax, 1					# return 1;
	jmp	.L9
.L17:
	cmp	DWORD PTR -72[rbp], 999999		# sizeOfS < 1000000
	jg	.L7
	mov	rax, QWORD PTR -48[rbp]			# input
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -56[rbp], eax			# c = fgetc(input)
	cmp	DWORD PTR -56[rbp], -1			# c == -1
	jne	.L18
.L7:
	call	clock@PLT				# вызов clock()
	mov	QWORD PTR -32[rbp], rax			# start = clock()
	mov	DWORD PTR -60[rbp], 0			# i = 0, начало цикла
	jmp	.L19
.L20:
	mov	edx, DWORD PTR -68[rbp]			# sizeOfEx в edx 
	mov	eax, DWORD PTR -72[rbp]			# sizeOfS в eax 
	mov	esi, edx				# esi = edx, a esi - параметр функции
	mov	edi, eax				# edi = eax, a edi - параметр функции
	call	find_substring@PLT			# вызов функции find_substring
	mov	DWORD PTR -64[rbp], eax			# res = возвращаемое значение
	add	DWORD PTR -60[rbp], 1			# ++i
.L19:
	cmp	DWORD PTR -60[rbp], 999			# i < 1000
	jle	.L20
	call	clock@PLT				# clock()
	mov	QWORD PTR -24[rbp], rax			# end = clock()
	mov	edx, DWORD PTR -64[rbp]			# res
	mov	rax, QWORD PTR -40[rbp]			# output
	lea	rcx, .LC11[rip]				# "%d"
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT				# fprintf(output, "%d", res)
	mov	rax, QWORD PTR -40[rbp]			# output
	mov	rdi, rax
	call	fclose@PLT				# fclose(output)
	mov	rax, QWORD PTR -48[rbp]			# input
	mov	rdi, rax
	call	fclose@PLT				# fclose(input)
	mov	rax, QWORD PTR -24[rbp]			# end
	sub	rax, QWORD PTR -32[rbp]			# start
	mov	rcx, rax
	movabs	rdx, 2361183241434822607		# / 1000
	mov	rax, rcx
	imul	rdx
	mov	rax, rdx
	sar	rax, 7
	sar	rcx, 63
	mov	rdx, rcx
	sub	rax, rdx				# end - start
	mov	rsi, rax
	lea	rax, .LC12[rip]				# "Working time: %ld ms\n"
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT				# выводим получившееся значение
	mov	eax, 0					# return 0;
.L9:
	mov	rbx, QWORD PTR -8[rbp]			# эпилог main
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
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
