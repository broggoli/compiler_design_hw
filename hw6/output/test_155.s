	.data
	.globl	arr
arr:
	.quad	0
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$17, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	