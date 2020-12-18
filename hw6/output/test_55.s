	.text
	.globl	foo
foo:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$42, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	bar
bar:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdi
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	$0, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$100, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	(%rdx), %rsi
	cmpq	$0, %rsi
	setne	%dl
	andq	$1, %rdx
	cmpq	$0, %rdx
	jne	then
	jmp	else
	.text
else:
	pushq	%rdi
	callq	bar
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, (%rdi)
	jmp	end
	.text
end:
	movq	(%rdi), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
then:
	pushq	%rdi
	callq	foo
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, (%rdi)
	jmp	end