	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$24, %rsp
	subq	$8, %rsp
	movq	%rsp, %rdi
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	$0, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r11
	movq	$3, %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	-8(%rbp), %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	_cond7235
	.text
_body7234:
	movq	%r8 , %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	(%r10), %r9 
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r9 , %rsi
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
	movq	%r9 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	(%r10), %rdx
	movq	%rdx, %r9 
	addq	$1, %r9 
	movq	%r9 , (%r10)
	jmp	_cond7235
	.text
_cond7235:
	movq	(%r10), %rdx
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	cmpq	-24(%rbp), %rdx
	setl	%r9b
	andq	$1, %r9 
	cmpq	$0, %r9 
	jne	_body7234
	jmp	_post7233
	.text
_merge7255:
	movq	(%rsi), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_notnull7256:
	movq	$4, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	jmp	_merge7255
	.text
_null7257:
	movq	$5, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	jmp	_merge7255
	.text
_post7233:
	movq	-8(%rbp), %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	(%rdi), %rdx
	cmpq	$0, %rdx
	sete	%dil
	andq	$1, %rdi
	cmpq	$0, %rdi
	jne	_null7257
	jmp	_notnull7256