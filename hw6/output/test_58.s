	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	jmp	_cond15
	.text
_body14:
	movq	(%rdx), %rsi
	movq	(%rdi), %r8 
	movq	%rsi, %r9 
	addq	%r8 , %r9 
	movq	(%rdi), %rsi
	movq	%r9 , %r8 
	imulq	%rsi, %r8 
	movq	%r8 , (%rdx)
	movq	(%rdi), %rsi
	movq	%rsi, %r8 
	addq	$1, %r8 
	movq	%r8 , (%rdi)
	jmp	_cond15
	.text
_cond15:
	movq	(%rdi), %rsi
	cmpq	$10, %rsi
	setl	%r8b
	andq	$1, %r8 
	cmpq	$0, %r8 
	jne	_body14
	jmp	_post13
	.text
_post13:
	movq	(%rdx), %rsi
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	