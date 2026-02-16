	.file	"Tribonacci2.c"
	.text
	.globl	nextTribonacci
	.type	nextTribonacci, @function
nextTribonacci:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	nextTribonacci, .-nextTribonacci
	.section	.rodata
.LC0:
	.string	"Tribonacci2 Program..."
.LC1:
	.string	"Enter an integer:"
.LC2:
	.string	"%d"
.LC3:
	.string	"%d\n"
.LC4:
	.string	"Done!"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$36, %esp
	movl	$1, -12(%ebp)
	movl	$1, -16(%ebp)
	movl	$2, -20(%ebp)
	subl	$12, %esp
	pushl	$.LC0
	call	puts
	addl	$16, %esp
	subl	$12, %esp
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	subl	$8, %esp
	leal	-28(%ebp), %eax
	pushl	%eax
	pushl	$.LC2
	call	__isoc99_scanf
	addl	$16, %esp
	movl	-28(%ebp), %eax
	cmpl	%eax, -12(%ebp)
	jg	.L4
	subl	$8, %esp
	pushl	-12(%ebp)
	pushl	$.LC3
	call	printf
	addl	$16, %esp
	movl	-28(%ebp), %eax
	cmpl	%eax, -16(%ebp)
	jg	.L4
	subl	$8, %esp
	pushl	-16(%ebp)
	pushl	$.LC3
	call	printf
	addl	$16, %esp
	jmp	.L5
.L6:
	subl	$8, %esp
	pushl	-20(%ebp)
	pushl	$.LC3
	call	printf
	addl	$16, %esp
	subl	$4, %esp
	pushl	-20(%ebp)
	pushl	-16(%ebp)
	pushl	-12(%ebp)
	call	nextTribonacci
	addl	$16, %esp
	movl	%eax, -24(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-20(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
.L5:
	movl	-28(%ebp), %eax
	cmpl	%eax, -20(%ebp)
	jle	.L6
.L4:
	subl	$12, %esp
	pushl	$.LC4
	call	puts
	addl	$16, %esp
	movl	$0, %eax
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 8.5.0 20210514 (Red Hat 8.5.0-10.1.0.1)"
	.section	.note.GNU-stack,"",@progbits
