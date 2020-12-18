	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	jmp	_then8254
	.text
_else8253:
	movq	$46, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_merge8252:
	movq	$0, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
_then8254:
	movq	$23, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	