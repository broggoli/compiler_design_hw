	.text
	.globl	naive_mod
naive_mod:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	jmp	start
	.text
final:
	movq	(%rdx), %r8 
	movq	%r8 , %rdx
	subq	%rsi, %rdx
	movq	%rdi, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
start:
	movq	(%rdx), %r9 
	movq	%rsi, %r8 
	addq	%r9 , %r8 
	movq	%r8 , (%rdx)
	cmpq	%rdi, %r8 
	setg	%r9b
	andq	$1, %r9 
	cmpq	$0, %r9 
	jne	final
	jmp	start
	.text
	.globl	naive_prime
naive_prime:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	$2, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	loop
	.text
final_false:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
final_true:
	movq	$1, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
inc:
	movq	(%r8 ), %rsi
	movq	$1, %rdx
	addq	%r9 , %rdx
	movq	%rdx, (%r8 )
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	callq	naive_mod
	popq	%rsi
	popq	%rdi
	popq	%r8 
	movq	%rax, %rdx
	movq	$0, %rax
	cmpq	%rdx, %rax
	sete	%sil
	andq	$1, %rsi
	cmpq	$0, %rsi
	jne	final_false
	jmp	loop
	.text
loop:
	movq	(%r8 ), %r9 
	movq	%r9 , %rdx
	imulq	%r9 , %rdx
	cmpq	%rdi, %rdx
	setg	%sil
	andq	$1, %rsi
	cmpq	$0, %rsi
	jne	final_true
	jmp	inc
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$100, %rdi
	callq	naive_prime
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	