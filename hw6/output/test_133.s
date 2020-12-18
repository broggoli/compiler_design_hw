	.data
	.globl	x
x:
	.quad	add
	.text
	.globl	add
add:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, (%rdx)
	movq	%rsi, (%r8 )
	movq	(%rdx), %rsi
	movq	(%r8 ), %rdx
	movq	%rsi, %rdi
	addq	%rdx, %rdi
	movq	%rdi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	x(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	pushq	%r15
	movq	%rdx, %r15
	pushq	%rdx
	movq	$4, %rsi
	movq	$3, %rdi
	callq	*%r15
	popq	%rdx
	popq	%r15
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	