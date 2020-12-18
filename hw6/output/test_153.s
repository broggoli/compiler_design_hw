	.data
	.globl	x
x:
	.quad	42
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	x(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	