	.text
	.globl	fact
fact:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rsi
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, (%rsi)
	movq	$1, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond793
	.text
_body792:
	movq	(%r8 ), %r9 
	movq	(%rsi), %rdx
	movq	%r9 , %rdi
	imulq	%rdx, %rdi
	movq	%rdi, (%r8 )
	movq	(%rsi), %rdx
	movq	%rdx, %rdi
	subq	$1, %rdi
	movq	%rdi, (%rsi)
	jmp	_cond793
	.text
_cond793:
	movq	(%rsi), %rdx
	cmpq	$0, %rdx
	setg	%dil
	andq	$1, %rdi
	cmpq	$0, %rdi
	jne	_body792
	jmp	_post791
	.text
_post791:
	movq	(%r8 ), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$5, %rdi
	callq	fact
	movq	%rax, %rsi
	pushq	%rsi
	movq	%rsi, %rdi
	callq	string_of_int
	popq	%rsi
	movq	%rax, %rdx
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	