	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	$1, %rax
	imulq	$2, %rax
	movq	%rax, -40(%rbp)
	movq	$2, %rax
	cmpq	-40(%rbp), %rax
	setl	-48(%rbp)
	andq	$1, -48(%rbp)
	movq	$42, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	