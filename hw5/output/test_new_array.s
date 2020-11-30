	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$272, %rsp
	movq	%rdi, %rax
	movq	%rax, -8(%rbp)
	movq	%rsi, %rax
	movq	%rax, -16(%rbp)
	pushq	$0
	movq	%rsp, -24(%rbp)
	pushq	$0
	movq	%rsp, -32(%rbp)
	pushq	$0
	movq	%rsp, -40(%rbp)
	pushq	$0
	movq	%rsp, -48(%rbp)
	pushq	$0
	movq	%rsp, -56(%rbp)
	movq	-8(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-16(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-32(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, -80(%rbp)
	movq	-80(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	callq	array_of_string
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, (%rax)
	movq	$5, %rax
	movq	%rax, %rdi
	callq	oat_alloc_array
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, -128(%rbp)
	movq	$0, %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, (%rax)
	jmp	_cond19
	.text
_cond19:
	movq	-48(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, -144(%rbp)
	movq	-144(%rbp), %rax
	movq	$5, %rcx
	cmpq	%rcx, %rax
	setl	-152(%rbp)
	andq	$1, -152(%rbp)
	movq	-152(%rbp), %rax
	cmpq	$0, %rax
	jne	_body18
	jmp	_post17
	.text
_body18:
	movq	-128(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, -160(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, -168(%rbp)
	movq	-160(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-168(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -176(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, -184(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, -192(%rbp)
	movq	-192(%rbp), %rax
	movq	$3, %rcx
	addq	%rcx, %rax
	movq	%rax, -200(%rbp)
	movq	-184(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-200(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, -208(%rbp)
	movq	-208(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, -216(%rbp)
	movq	-216(%rbp), %rcx
	movq	-176(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-48(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, -232(%rbp)
	movq	-232(%rbp), %rax
	movq	$1, %rcx
	addq	%rcx, %rax
	movq	%rax, -240(%rbp)
	movq	-240(%rbp), %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, (%rax)
	jmp	_cond19
	.text
_post17:
	movq	-128(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-56(%rbp), %rax
	movq	(%rax), %rcx
	movq	%rcx, -264(%rbp)
	movq	-264(%rbp), %rax
	movq	%rax, %rdi
	callq	string_of_array
	movq	%rax, -272(%rbp)
	movq	-272(%rbp), %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	