	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$192, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, -24(%rbp)
	subq	$8, %rsp
	movq	%rsp, -32(%rbp)
	subq	$8, %rsp
	movq	%rsp, -40(%rbp)
	subq	$8, %rsp
	movq	%rsp, -48(%rbp)
	subq	$8, %rsp
	movq	%rsp, -56(%rbp)
	subq	$8, %rsp
	movq	%rsp, -64(%rbp)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$3, %rdi
	callq	oat_alloc_array
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -80(%rbp)
	subq	$8, %rsp
	movq	%rsp, -88(%rbp)
	movq	$3, %rax
	movq	-88(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, -96(%rbp)
	movq	-80(%rbp), %rax
	movq	-96(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond20
	.text
_cond20:
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -104(%rbp)
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -112(%rbp)
	movq	-104(%rbp), %rax
	cmpq	-112(%rbp), %rax
	setl	-120(%rbp)
	andq	$1, -120(%rbp)
	cmpq	$0, -120(%rbp)
	jne	_body19
	jmp	_post18
	.text
_body19:
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -128(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -136(%rbp)
	movq	-128(%rbp), %rax
	movq	%rax, -144(%rbp)
	movq	-136(%rbp), %rsi
	movq	-144(%rbp), %rdi
	callq	oat_assert_array_length
	movq	-128(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-136(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -152(%rbp)
	movq	$0, %rax
	movq	-152(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -160(%rbp)
	movq	-160(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -168(%rbp)
	movq	-168(%rbp), %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond20
	.text
_post18:
	movq	-80(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -176(%rbp)
	movq	-176(%rbp), %rax
	cmpq	$0, %rax
	sete	-184(%rbp)
	andq	$1, -184(%rbp)
	cmpq	$0, -184(%rbp)
	jne	_null42
	jmp	_notnull41
	.text
_notnull41:
	movq	-176(%rbp), %rax
	movq	-64(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$4, %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_merge40
	.text
_null42:
	movq	$5, %rax
	movq	-56(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_merge40
	.text
_merge40:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -192(%rbp)
	movq	-192(%rbp), %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	