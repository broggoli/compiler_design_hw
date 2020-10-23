	.text
	.globl	f1
f1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rdi, 0(%rbp)
	.text
	.globl	f2
f2:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rdi, 0(%rbp)
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, 0(%rbp)
	movq	%rsi, -8(%rbp)