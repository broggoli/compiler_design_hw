	.text
	.globl	binary_gcd
binary_gcd:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, (%r9 )
	movq	%rsi, (%r8 )
	movq	(%r9 ), %rsi
	movq	(%r8 ), %rdx
	cmpq	%rdx, %rsi
	sete	%dil
	andq	$1, %rdi
	cmpq	$0, %rdi
	jne	_then4931
	jmp	_else4930
	.text
_else4930:
	jmp	_merge4929
	.text
_else4936:
	jmp	_merge4935
	.text
_else4942:
	jmp	_merge4941
	.text
_else4962:
	movq	(%r8 ), %rdx
	movq	%rdx, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rdi
	movq	(%r9 ), %rdx
	movq	%rdx, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rsi
	pushq	%rdi
	pushq	%rsi
	pushq	%rdi
	movq	%rsi, %rdi
	popq	%rsi
	callq	binary_gcd
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	$1, %rcx
	shlq	%cl, %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_else4965:
	jmp	_merge4964
	.text
_else4976:
	jmp	_merge4975
	.text
_else4988:
	jmp	_merge4987
	.text
_merge4929:
	movq	(%r9 ), %rdx
	cmpq	$0, %rdx
	sete	%sil
	andq	$1, %rsi
	cmpq	$0, %rsi
	jne	_then4937
	jmp	_else4936
	.text
_merge4935:
	movq	(%r8 ), %rdx
	cmpq	$0, %rdx
	sete	%sil
	andq	$1, %rsi
	cmpq	$0, %rsi
	jne	_then4943
	jmp	_else4942
	.text
_merge4941:
	movq	(%r9 ), %rdx
	movq	%rdx, %rsi
	xorq	$-1, %rsi
	movq	%rsi, %rdi
	andq	$1, %rdi
	cmpq	$1, %rdi
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4966
	jmp	_else4965
	.text
_merge4961:
	jmp	_merge4964
	.text
_merge4964:
	movq	(%r8 ), %rdx
	movq	%rdx, %rsi
	xorq	$-1, %rsi
	movq	%rsi, %rdi
	andq	$1, %rdi
	cmpq	$1, %rdi
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4977
	jmp	_else4976
	.text
_merge4975:
	movq	(%r9 ), %rsi
	movq	(%r8 ), %rdx
	cmpq	%rdx, %rsi
	setg	%dil
	andq	$1, %rdi
	cmpq	$0, %rdi
	jne	_then4989
	jmp	_else4988
	.text
_merge4987:
	movq	(%r9 ), %rdi
	movq	(%r8 ), %rdx
	movq	(%r9 ), %rsi
	movq	%rdx, %r8 
	subq	%rsi, %r8 
	movq	%r8 , %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rsi
	pushq	%rdi
	pushq	%rsi
	pushq	%rdi
	movq	%rsi, %rdi
	popq	%rsi
	callq	binary_gcd
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4931:
	movq	(%r9 ), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4937:
	movq	(%r8 ), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4943:
	movq	(%r9 ), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4963:
	movq	(%r8 ), %rdx
	movq	(%r9 ), %rsi
	movq	%rsi, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rdi
	pushq	%rdi
	pushq	%rdx
	movq	%rdx, %rsi
	callq	binary_gcd
	popq	%rdx
	popq	%rdi
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4966:
	movq	(%r8 ), %rdx
	movq	%rdx, %rsi
	andq	$1, %rsi
	cmpq	$1, %rsi
	sete	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_then4963
	jmp	_else4962
	.text
_then4977:
	movq	(%r8 ), %rdx
	movq	%rdx, %rax
	movq	$1, %rcx
	shrq	%cl, %rax
	movq	%rax, %rdi
	movq	(%r9 ), %rdx
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
_then4989:
	movq	(%r8 ), %rsi
	movq	(%r9 ), %rdi
	movq	(%r8 ), %rdx
	movq	%rdi, %r8 
	subq	%rdx, %r8 
	movq	%r8 , %rax
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
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdi
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	$21, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$15, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	movq	(%rsi), %rdx
	movq	(%rdi), %rsi
	pushq	%rsi
	pushq	%rdx
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	callq	binary_gcd
	popq	%rdx
	popq	%rsi
	movq	%rax, %rdi
	movq	%rdi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	