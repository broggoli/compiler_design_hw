	.data
	.globl	node1
node1:
	.quad	node2
	.quad	node3
	.quad	50
	.data
	.globl	node2
node2:
	.quad	node4
	.quad	node5
	.quad	25
	.data
	.globl	node3
node3:
	.quad	node6
	.quad	node7
	.quad	75
	.data
	.globl	node4
node4:
	.quad	node8
	.quad	0
	.quad	10
	.data
	.globl	node5
node5:
	.quad	0
	.quad	0
	.quad	30
	.data
	.globl	node6
node6:
	.quad	0
	.quad	0
	.quad	60
	.data
	.globl	node7
node7:
	.quad	0
	.quad	0
	.quad	80
	.data
	.globl	node8
node8:
	.quad	0
	.quad	0
	.quad	1
	.text
	.globl	contains
contains:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	(%rdx), %r8 
	cmpq	%rsi, %r8 
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	equal
	jmp	notequal
	.text
equal:
	movq	$1, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
left:
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	cmpq	$0, %rdi
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	none
	jmp	left_next
	.text
left_next:
	pushq	%rdi
	pushq	%rsi
	callq	contains
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
none:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
notequal:
	cmpq	%rsi, %r8 
	setg	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	left
	jmp	right
	.text
right:
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	cmpq	$0, %rdi
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	none
	jmp	right_next
	.text
right_next:
	pushq	%rdi
	pushq	%rsi
	callq	contains
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	$50, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	movq	%rax, %rdx
	pushq	%rdx
	movq	$25, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rdx
	movq	%rax, %rsi
	pushq	%rsi
	pushq	%rdx
	movq	$75, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rdx
	popq	%rsi
	movq	%rax, %r9 
	pushq	%r9 
	pushq	%rsi
	pushq	%rdx
	movq	$10, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rdx
	popq	%rsi
	popq	%r9 
	movq	%rax, -8(%rbp)
	pushq	%r9 
	pushq	%rsi
	pushq	%rdx
	movq	$30, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rdx
	popq	%rsi
	popq	%r9 
	movq	%rax, -16(%rbp)
	pushq	%r9 
	pushq	%rsi
	pushq	%rdx
	movq	$60, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rdx
	popq	%rsi
	popq	%r9 
	movq	%rax, -24(%rbp)
	pushq	%r9 
	pushq	%rsi
	pushq	%rdx
	movq	$80, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rdx
	popq	%rsi
	popq	%r9 
	movq	%rax, -32(%rbp)
	pushq	%r9 
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rdx
	popq	%rsi
	popq	%r9 
	movq	%rax, %r8 
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	$100, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rdx
	popq	%rsi
	popq	%r8 
	popq	%r9 
	movq	%rax, %r11
	pushq	%r11
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	$120, %rsi
	leaq	node1(%rip), %rdi
	callq	contains
	popq	%rdx
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r11
	movq	%rax, %rdi
	movq	%rdx, %r10
	addq	%rsi, %r10
	movq	%r9 , %rdx
	addq	-8(%rbp), %rdx
	movq	-16(%rbp), %r9 
	addq	-24(%rbp), %r9 
	movq	-32(%rbp), %rsi
	addq	%r8 , %rsi
	movq	%r11, %r8 
	addq	%rdi, %r8 
	movq	%r10, %rdi
	addq	%rdx, %rdi
	movq	%r9 , %rdx
	addq	%rsi, %rdx
	movq	%rdi, %rsi
	addq	%rdx, %rsi
	movq	%rsi, %rdx
	addq	%r8 , %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	