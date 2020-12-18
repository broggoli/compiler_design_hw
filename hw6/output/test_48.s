	.data
	.globl	glist
glist:
	.quad	1
	.quad	2
	.quad	3
	.quad	4
	.quad	5
	.text
	.globl	search
search:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r9 
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	loop
	.text
check:
	movq	%rsi, %rax
	addq	$0, %rax
	movq	%rax, %rcx
	movq	%r10, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %r8 
	movq	(%r8 ), %rdx
	cmpq	%rdx, %rdi
	sete	%r8b
	andq	$1, %r8 
	movq	$1, %rdx
	addq	%r10, %rdx
	movq	%rdx, (%r9 )
	cmpq	$0, %r8 
	jne	true
	jmp	loop
	.text
false:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
loop:
	movq	(%r9 ), %r10
	cmpq	$5, %r10
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	false
	jmp	check
	.text
true:
	movq	$1, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	glist(%rip), %rsi
	movq	$3, %rdi
	callq	search
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	