	.text
	.globl	foo
foo:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rcx, -8(%rbp)
	movq	%r9 , %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	bar
bar:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rcx, -8(%rbp)
	movq	16(%rbp), %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	baz
baz:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rcx, -8(%rbp)
	movq	24(%rbp), %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	$8
	pushq	$7
	movq	$6, %r9 
	movq	$5, %r8 
	movq	$4, %rcx
	movq	$3, %rdx
	movq	$2, %rsi
	movq	$1, %rdi
	callq	foo
	addq	$16, %rsp
	movq	%rax, %r8 
	pushq	%r8 
	pushq	$8
	pushq	$7
	movq	$6, %r9 
	movq	$5, %r8 
	movq	$4, %rcx
	movq	$3, %rdx
	movq	$2, %rsi
	movq	$1, %rdi
	callq	bar
	addq	$16, %rsp
	popq	%r8 
	movq	%rax, %rdx
	pushq	%r8 
	pushq	%rdx
	pushq	$8
	pushq	$7
	movq	$6, %r9 
	movq	$5, %r8 
	movq	$4, %rcx
	movq	$3, %rdx
	movq	$2, %rsi
	movq	$1, %rdi
	callq	baz
	addq	$16, %rsp
	popq	%rdx
	popq	%r8 
	movq	%rax, %rdi
	movq	%r8 , %rsi
	addq	%rdx, %rsi
	movq	%rsi, %rdx
	addq	%rdi, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	