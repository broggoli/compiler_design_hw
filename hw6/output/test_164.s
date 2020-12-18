	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	jmp	_then8272
	.text
_else8271:
	movq	$2, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_merge8270:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then8272:
	movq	$-96, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	