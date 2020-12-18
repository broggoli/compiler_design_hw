	.text
	.globl	call
call:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, (%rdx)
	movq	%rsi, (%r8 )
	movq	(%rdx), %rsi
	movq	(%r8 ), %rdi
	pushq	%r15
	movq	%rsi, %r15
	pushq	%rdi
	pushq	%rsi
	callq	*%r15
	popq	%rsi
	popq	%rdi
	popq	%r15
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	inc
inc:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	%rdi, (%rsi)
	movq	(%rsi), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$3, %rsi
	leaq	inc(%rip), %rdi
	callq	call
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	