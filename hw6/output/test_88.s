	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$24, %rsp
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, %rsi
	pushq	%r9 
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r10
	subq	$8, %rsp
	movq	%rsp, %r11
	movq	$3, %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	%r10, (%rdi)
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond1788
	.text
_body1787:
	movq	%rdi, %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	(%r9 ), %r8 
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r8 , %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-16(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r8 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	$110, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rdx
	movq	%rdx, %r8 
	addq	$1, %r8 
	movq	%r8 , (%r9 )
	jmp	_cond1788
	.text
_cond1788:
	movq	(%r9 ), %rdx
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	cmpq	-24(%rbp), %rdx
	setl	%r8b
	andq	$1, %r8 
	cmpq	$0, %r8 
	jne	_body1787
	jmp	_post1786
	.text
_post1786:
	movq	%r10, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	pushq	%rdi
	pushq	%rsi
	callq	string_of_array
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, (%rsi)
	movq	(%rsi), %rdx
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_string
	popq	%rdx
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	