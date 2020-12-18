	.text
	.globl	binary_gcd
binary_gcd:
	pushq	%rbp
	movq	%rsp, %rbp
	cmpq	%rsi, %rdi
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	ret_u
	jmp	term1
	.text
both_even:
	movq	%rdi, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %r8 
	movq	%rsi, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rdx
	pushq	%r8 
	pushq	%rdx
	movq	%rdx, %rsi
	movq	%r8 , %rdi
	callq	binary_gcd
	popq	%rdx
	popq	%r8 
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	$1, %rcx
	shlq	%cl, %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
gcd:
	movq	$-1, %rdx
	xorq	%rdi, %rdx
	movq	$1, %r8 
	andq	%rdx, %r8 
	movq	$0, %rax
	cmpq	%r8 , %rax
	setne	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	u_even
	jmp	u_odd
	.text
ret_u:
	movq	%rdi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
ret_v:
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
term1:
	movq	$0, %rax
	cmpq	%rdi, %rax
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	ret_v
	jmp	term2
	.text
term2:
	movq	$0, %rax
	cmpq	%rsi, %rax
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	ret_u
	jmp	gcd
	.text
u_even:
	movq	%rsi, %r8 
	andq	$1, %r8 
	movq	$0, %rax
	cmpq	%r8 , %rax
	setne	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	ue_vo
	jmp	both_even
	.text
u_gt:
	movq	%rdi, %rdx
	subq	%rsi, %rdx
	movq	%rdx, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rdi
	pushq	%rdi
	pushq	%rsi
	callq	binary_gcd
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
u_odd:
	movq	$-1, %rdx
	xorq	%rsi, %rdx
	movq	$1, %r8 
	andq	%rdx, %r8 
	movq	$0, %rax
	cmpq	%r8 , %rax
	setne	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	v_even
	jmp	v_odd
	.text
ue_vo:
	movq	%rdi, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %r8 
	pushq	%r8 
	pushq	%rsi
	movq	%r8 , %rdi
	callq	binary_gcd
	popq	%rsi
	popq	%r8 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
v_even:
	movq	%rsi, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %r8 
	pushq	%r8 
	pushq	%rdi
	movq	%r8 , %rsi
	callq	binary_gcd
	popq	%rdi
	popq	%r8 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
v_gt:
	movq	%rsi, %r8 
	subq	%rdi, %r8 
	movq	%r8 , %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rdx
	pushq	%rdi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	binary_gcd
	popq	%rdx
	popq	%rdi
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
v_odd:
	cmpq	%rsi, %rdi
	setg	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	u_gt
	jmp	v_gt
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$15, %rsi
	movq	$21, %rdi
	callq	binary_gcd
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	