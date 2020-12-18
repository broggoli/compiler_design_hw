	.text
	.globl	create_pair
create_pair:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, (%r9 )
	movq	%rsi, (%r8 )
	pushq	%r9 
	pushq	%r8 
	movq	$16, %rdi
	callq	oat_malloc
	popq	%r8 
	popq	%r9 
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	movq	(%r9 ), %rdi
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %rsi
	movq	%rdi, (%rsi)
	movq	(%r8 ), %rdi
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rsi
	movq	%rdi, (%rsi)
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
	pushq	%rdi
	movq	$0, %rsi
	movq	$1, %rdi
	callq	create_pair
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, (%rdi)
	movq	(%rdi), %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$0, %rax
	movq	%rax, %r8 
	movq	(%r8 ), %rsi
	movq	(%rdi), %rdx
	movq	%rdx, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rdi
	movq	(%rdi), %rdx
	movq	%rsi, %rdi
	andq	%rdx, %rdi
	cmpq	$0, %rdi
	jne	_then6802
	jmp	_else6801
	.text
_else6801:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_merge6800:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then6802:
	movq	$1, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	