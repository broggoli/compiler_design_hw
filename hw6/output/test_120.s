	.text
	.globl	gcd
gcd:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, (%r10)
	movq	%rsi, (%r9 )
	jmp	_cond6229
	.text
_body6228:
	movq	(%r9 ), %rdx
	movq	%rdx, (%r8 )
	movq	(%r9 ), %rsi
	movq	(%r10), %rdi
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	callq	mod
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, (%r9 )
	movq	(%r8 ), %rdx
	movq	%rdx, (%r10)
	jmp	_cond6229
	.text
_cond6229:
	movq	(%r9 ), %rsi
	cmpq	$0, %rsi
	setne	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body6228
	jmp	_post6227
	.text
_post6227:
	movq	(%r10), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	mod
mod:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, (%r10)
	movq	%rsi, (%r9 )
	movq	(%r10), %rdx
	movq	%rdx, (%r8 )
	jmp	_cond6213
	.text
_body6212:
	movq	(%r8 ), %rdx
	movq	(%r9 ), %rdi
	movq	%rdx, %rsi
	subq	%rdi, %rsi
	movq	%rsi, (%r8 )
	jmp	_cond6213
	.text
_cond6213:
	movq	(%r8 ), %rdx
	movq	(%r9 ), %rdi
	movq	%rdx, %rsi
	subq	%rdi, %rsi
	cmpq	$0, %rsi
	setge	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body6212
	jmp	_post6211
	.text
_post6211:
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
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	$64, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	movq	$48, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	(%rdx), %rsi
	movq	(%r8 ), %rdi
	pushq	%rdi
	pushq	%rsi
	callq	gcd
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	