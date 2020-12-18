	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	jmp	_then8241
	.text
_else8240:
	movq	$4, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_merge8239:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then8241:
	movq	$9, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	