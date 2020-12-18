	.text
	.globl	fibR
fibR:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, (%r8 )
	movq	(%r8 ), %rdx
	cmpq	$0, %rdx
	sete	%sil
	andq	$1, %rsi
	cmpq	$0, %rsi
	jne	_then4725
	jmp	_else4724
	.text
_else4724:
	jmp	_merge4723
	.text
_else4729:
	jmp	_merge4728
	.text
_merge4723:
	movq	(%r8 ), %rdx
	cmpq	$1, %rdx
	sete	%sil
	andq	$1, %rsi
	cmpq	$0, %rsi
	jne	_then4730
	jmp	_else4729
	.text
_merge4728:
	movq	(%r8 ), %rdx
	movq	%rdx, %rdi
	subq	$1, %rdi
	pushq	%r8 
	pushq	%rdi
	callq	fibR
	popq	%rdi
	popq	%r8 
	movq	%rax, %rsi
	movq	(%r8 ), %rdx
	movq	%rdx, %rdi
	subq	$2, %rdi
	pushq	%rdi
	pushq	%rsi
	callq	fibR
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rsi, %rdi
	addq	%rdx, %rdi
	movq	%rdi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4725:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4730:
	movq	$1, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	fibI
fibI:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %rsi
	movq	%rdi, (%r8 )
	movq	$0, %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	movq	$1, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	movq	(%r8 ), %rdx
	cmpq	$0, %rdx
	sete	%dil
	andq	$1, %rdi
	cmpq	$0, %rdi
	jne	_then4690
	jmp	_else4689
	.text
_body4701:
	movq	(%r9 ), %rdx
	movq	%rdx, (%rsi)
	movq	(%r9 ), %rdi
	movq	(%r10), %r11
	movq	%rdi, %rdx
	addq	%r11, %rdx
	movq	%rdx, (%r9 )
	movq	(%rsi), %rdx
	movq	%rdx, (%r10)
	movq	(%r8 ), %rdx
	movq	%rdx, %rdi
	subq	$1, %rdi
	movq	%rdi, (%r8 )
	jmp	_cond4702
	.text
_cond4702:
	movq	(%r8 ), %rdx
	movq	%rdx, %rdi
	subq	$2, %rdi
	cmpq	$0, %rdi
	setg	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	_body4701
	jmp	_post4700
	.text
_else4689:
	jmp	_merge4688
	.text
_else4695:
	jmp	_merge4694
	.text
_merge4688:
	movq	(%r8 ), %rdx
	cmpq	$1, %rdx
	sete	%dil
	andq	$1, %rdi
	cmpq	$0, %rdi
	jne	_then4696
	jmp	_else4695
	.text
_merge4694:
	jmp	_cond4702
	.text
_post4700:
	movq	(%r10), %rdi
	movq	(%r9 ), %rsi
	movq	%rdi, %rdx
	addq	%rsi, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4690:
	movq	(%r10), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4696:
	movq	(%r9 ), %rdx
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
	movq	%rsp, %rsi
	movq	$1, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	pushq	%rsi
	movq	$12, %rdi
	callq	fibR
	popq	%rsi
	movq	%rax, %rdx
	cmpq	$144, %rdx
	sete	%r8b
	andq	$1, %r8 
	pushq	%r8 
	pushq	%rsi
	movq	$12, %rdi
	callq	fibI
	popq	%rsi
	popq	%r8 
	movq	%rax, %rdx
	cmpq	$144, %rdx
	sete	%dil
	andq	$1, %rdi
	movq	%r8 , %rdx
	andq	%rdi, %rdx
	cmpq	$0, %rdx
	jne	_then4676
	jmp	_else4675
	.text
_else4675:
	jmp	_merge4674
	.text
_merge4674:
	movq	(%rsi), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then4676:
	movq	$0, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	jmp	_merge4674