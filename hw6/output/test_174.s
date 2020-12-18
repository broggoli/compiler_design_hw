	.data
	.globl	i
i:
	.quad	3
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$341, %rax
	leaq	i(%rip), %rcx
	movq	%rax, (%rcx)
	leaq	i(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	