	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	$9, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rdi
	movq	(%r9 ), %rdx
	movq	%rdi, %r8 
	addq	%rdx, %r8 
	movq	%r8 , (%rsi)
	movq	(%r9 ), %r8 
	movq	(%r9 ), %rdi
	movq	(%r9 ), %rdx
	movq	%rdi, %r9 
	imulq	%rdx, %r9 
	movq	%r8 , %rdi
	addq	%r9 , %rdi
	movq	(%rsi), %rdx
	movq	%rdi, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rax
	movq	$2, %rcx
	shrq	%cl, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	$2, %rcx
	shlq	%cl, %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	$2, %rcx
	sarq	%cl, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	