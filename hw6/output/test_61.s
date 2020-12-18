	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	$17, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	$18, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	(%rdx), %rdi
	movq	(%rsi), %rdx
	movq	%rdi, %rsi
	addq	%rdx, %rsi
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	