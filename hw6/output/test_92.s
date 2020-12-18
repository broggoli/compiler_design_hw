	.data
	.globl	str
str:
	.quad	_str2194
	.data
	.globl	_str2194
_str2194:
	.asciz	"hello"
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, %rdi
	subq	$8, %rsp
	movq	%rsp, %r8 
	leaq	str(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	array_of_string
	popq	%rdx
	popq	%rdi
	popq	%r8 
	popq	%r9 
	movq	%rax, %rsi
	movq	%rsi, (%r9 )
	movq	$0, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond2178
	.text
_body2177:
	movq	(%rdi), %rsi
	movq	(%r9 ), %r11
	movq	(%r8 ), %r10
	movq	%r11, %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r10, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%r11, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r10, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rdx), %r10
	movq	%rsi, %rdx
	addq	%r10, %rdx
	movq	%rdx, (%rdi)
	movq	(%r8 ), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, (%r8 )
	jmp	_cond2178
	.text
_cond2178:
	movq	(%r8 ), %rdx
	cmpq	$5, %rdx
	setl	%sil
	andq	$1, %rsi
	cmpq	$0, %rsi
	jne	_body2177
	jmp	_post2176
	.text
_post2176:
	movq	(%rdi), %rdx
	pushq	%rdi
	pushq	%rdx
	movq	%rdx, %rdi
	callq	print_int
	popq	%rdx
	popq	%rdi
	movq	(%rdi), %rdx
	movq	%rdx, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	