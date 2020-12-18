	.data
	.globl	i
i:
	.quad	0
	.text
	.globl	f
f:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, %r9 
	movq	%rdi, (%r10)
	movq	%rsi, (%r8 )
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	movq	(%r10), %rdx
	cmpq	$1, %rdx
	setge	%sil
	andq	$1, %rsi
	cmpq	$0, %rsi
	jne	_then930
	jmp	_else929
	.text
_else929:
	movq	(%r10), %rsi
	movq	(%r8 ), %rdx
	movq	%rsi, %rdi
	addq	%rdx, %rdi
	movq	%rdi, (%r9 )
	jmp	_merge928
	.text
_merge928:
	movq	(%r9 ), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then930:
	movq	(%r8 ), %rdx
	movq	(%r10), %rsi
	movq	%rsi, %rdi
	subq	$1, %rdi
	pushq	%r9 
	pushq	%rdi
	pushq	%rdx
	movq	%rdx, %rsi
	callq	f
	popq	%rdx
	popq	%rdi
	popq	%r9 
	movq	%rax, %rsi
	movq	$1, %rdx
	addq	%rsi, %rdx
	movq	%rdx, (%r9 )
	jmp	_merge928
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdi
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	$3, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$3, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	(%rsi), %rdx
	movq	(%rdi), %rsi
	pushq	%rsi
	pushq	%rdx
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	callq	f
	popq	%rdx
	popq	%rsi
	movq	%rax, %rdi
	leaq	i(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdi, %rsi
	addq	%rdx, %rsi
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	