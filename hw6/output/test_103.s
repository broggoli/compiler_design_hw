	.text
	.globl	f
f:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	%rdi, (%r8 )
	movq	$0, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	(%r8 ), %rdx
	cmpq	$0, %rdx
	sete	%dil
	andq	$1, %rdi
	cmpq	$0, %rdi
	jne	_then2792
	jmp	_else2791
	.text
_else2791:
	movq	(%r8 ), %rdi
	movq	(%r8 ), %rdx
	movq	%rdx, %r8 
	subq	$1, %r8 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	%r8 , %rdi
	callq	f
	popq	%rsi
	popq	%rdi
	popq	%r8 
	movq	%rax, %rdx
	movq	%rdi, %r8 
	imulq	%rdx, %r8 
	movq	%r8 , (%rsi)
	jmp	_merge2790
	.text
_merge2790:
	movq	(%rsi), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then2792:
	movq	$1, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	jmp	_merge2790
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$5, %rdi
	callq	f
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	