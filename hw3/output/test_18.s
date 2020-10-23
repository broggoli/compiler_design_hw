	.data
	.globl	gbl
gbl:
	.quad	12
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, 0(%rbp)
	movq	%rsi, -8(%rbp)