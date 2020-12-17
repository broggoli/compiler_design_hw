	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$168, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, -24(%rbp)
	subq	$8, %rsp
	movq	%rsp, -32(%rbp)
	subq	$8, %rsp
	movq	%rsp, -40(%rbp)
	movq	$0, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$3, %rdi
	callq	oat_alloc_array
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	subq	$8, %rsp
	movq	%rsp, -64(%rbp)
	movq	$3, %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -72(%rbp)
	movq	-56(%rbp), %rax
	movq	-72(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond20
	.text
_body19:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -80(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -88(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -96(%rbp)
	movq	-88(%rbp), %rsi
	movq	-96(%rbp), %rdi
	callq	oat_assert_array_length
	movq	-80(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-88(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -104(%rbp)
	movq	$0, %rax
	movq	-104(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond20
	.text
_cond20:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -128(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -136(%rbp)
	movq	-128(%rbp), %rax
	cmpq	-136(%rbp), %rax
	setl	-144(%rbp)
	andq	$1, -144(%rbp)
	cmpq	$0, -144(%rbp)
	jne	_body19
	jmp	_post18
	.text
_merge40:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -152(%rbp)
	movq	-152(%rbp), %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_notnull41:
	movq	$4, %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_merge40
	.text
_null42:
	movq	$5, %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_merge40
	.text
_post18:
	movq	-56(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -160(%rbp)
	movq	-160(%rbp), %rax
	cmpq	$0, %rax
	sete	-168(%rbp)
	andq	$1, -168(%rbp)
	cmpq	$0, -168(%rbp)
	jne	_null42
	jmp	_notnull41