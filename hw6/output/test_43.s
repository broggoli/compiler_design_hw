	.data
	.globl	test1
test1:
	.quad	0
	.quad	0
	.quad	100
	.data
	.globl	test2
test2:
	.quad	test1
	.quad	0
	.quad	10
	.data
	.globl	test3
test3:
	.quad	0
	.quad	0
	.quad	1
	.data
	.globl	test
test:
	.quad	test2
	.quad	test3
	.quad	5
	.text
	.globl	sum_tree
sum_tree:
	pushq	%rbp
	movq	%rsp, %rbp
	cmpq	$0, %rdi
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	then
	jmp	else
	.text
else:
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	(%rdx), %r9 
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	pushq	%r9 
	pushq	%rdi
	pushq	%rsi
	movq	%rsi, %rdi
	callq	sum_tree
	popq	%rsi
	popq	%rdi
	popq	%r9 
	movq	%rax, %rdx
	movq	%r9 , %r8 
	addq	%rdx, %r8 
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rsi
	movq	(%rsi), %rdx
	pushq	%r8 
	pushq	%rdx
	movq	%rdx, %rdi
	callq	sum_tree
	popq	%rdx
	popq	%r8 
	movq	%rax, %rsi
	movq	%r8 , %rdx
	addq	%rsi, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
then:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	test(%rip), %rdi
	callq	sum_tree
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	