	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rsi
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	$0, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	jmp	_cond40
	.text
_body39:
	movq	(%rsi), %rdx
	movq	%rdx, %r8 
	addq	$2, %r8 
	movq	%r8 , (%rsi)
	movq	(%rdi), %rdx
	movq	%rdx, %r8 
	addq	$1, %r8 
	movq	%r8 , (%rdi)
	jmp	_cond40
	.text
_cond40:
	movq	(%rdi), %rdx
	cmpq	$3, %rdx
	setl	%r8b
	andq	$1, %r8 
	cmpq	$0, %r8 
	jne	_body39
	jmp	_post38
	.text
_post38:
	movq	(%rsi), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	