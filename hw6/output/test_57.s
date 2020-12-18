	.text
	.globl	factorial
factorial:
	pushq	%rbp
	movq	%rsp, %rbp
	cmpq	$0, %rdi
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	ret1
	jmp	recurse
	.text
recurse:
	movq	%rdi, %rdx
	subq	$1, %rdx
	pushq	%rdi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	factorial
	popq	%rdx
	popq	%rdi
	movq	%rax, %rsi
	movq	%rdi, %rdx
	imulq	%rsi, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
ret1:
	movq	$1, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$5, %rdi
	callq	factorial
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	