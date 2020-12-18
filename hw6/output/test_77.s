	.data
	.globl	i
i:
	.quad	42
	.text
	.globl	f
f:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	%rdi, (%rsi)
	movq	(%rsi), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	g
g:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	%rdi, (%rsi)
	movq	(%rsi), %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	pushq	%rsi
	pushq	%rdx
	movq	%rsi, %rdi
	movq	$2, %rsi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rsi
	movq	(%rsi), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdi
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %rsi
	subq	$8, %rsp
	movq	%rsp, %r8 
	pushq	%r10
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$2, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r9 
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$2, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r11
	movq	%r11, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%r11, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$2, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%r9 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	%r11, (%rdx)
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$2, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r11
	movq	%r11, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$3, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%r11, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$4, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%r9 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	%r11, (%rdx)
	movq	%r9 , (%rdi)
	pushq	%r10
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$4, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r9 
	movq	%r9 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$0, %rax
	movq	%rax, %rdx
	movq	$1, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%r9 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	$2, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%r9 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$16, %rax
	movq	%rax, %rdx
	movq	$3, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%r9 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movq	$4, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	%r9 , (%r10)
	movq	$0, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond848
	.text
_body847:
	movq	(%rsi), %rdx
	movq	%rdx, %r9 
	addq	$1, %r9 
	movq	%r9 , (%rsi)
	movq	(%r8 ), %rdx
	movq	%rdx, %r9 
	addq	$1, %r9 
	movq	%r9 , (%r8 )
	jmp	_cond848
	.text
_cond848:
	movq	(%r8 ), %rdx
	cmpq	$100, %rdx
	setl	%r9b
	andq	$1, %r9 
	cmpq	$0, %r9 
	jne	_body847
	jmp	_post846
	.text
_post846:
	movq	(%r10), %rdx
	pushq	%r10
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	g
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r10
	movq	%rax, %r8 
	leaq	i(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %r9 
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	%r9 , %rdi
	callq	f
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%r8 , %r9 
	addq	%rdx, %r9 
	movq	(%r10), %r8 
	movq	%r8 , %rax
	movq	%rax, %rdx
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	$3, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movq	(%rdx), %r8 
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	%r8 , %rdi
	callq	f
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	movq	%rax, %rdx
	movq	%r9 , %r8 
	addq	%rdx, %r8 
	movq	(%rdi), %r9 
	movq	%r9 , %rax
	movq	%rax, %rdx
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%r8 
	popq	%r9 
	movq	%r9 , %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	%rdi, %rax
	movq	%rax, %rdx
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	movq	%rdi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	callq	f
	popq	%rsi
	popq	%rdi
	popq	%r8 
	movq	%rax, %rdx
	movq	%r8 , %r9 
	addq	%rdx, %r9 
	movq	(%rsi), %rdi
	pushq	%r9 
	pushq	%rdi
	callq	f
	popq	%rdi
	popq	%r9 
	movq	%rax, %rdx
	movq	%r9 , %rsi
	addq	%rdx, %rsi
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	