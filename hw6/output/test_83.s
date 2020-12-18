	.text
	.globl	f
f:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$8, %rsp
	movq	%rsp, %rdx
	movq	%rdi, (%rdx)
	movq	(%rdx), %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	g
g:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	subq	$8, %rsp
	movq	%rsp, %rsi
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%rdi, (%rsi)
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%r8 
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r11
	movq	$3, %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %rdi
	movq	-16(%rbp), %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond1332
	.text
_body1331:
	movq	%rdi, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	(%r9 ), %r10
	movq	-24(%rbp), %rax
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
	movq	-24(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r10, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rdx
	movq	%rdx, %r10
	addq	$1, %r10
	movq	%r10, (%r9 )
	jmp	_cond1332
	.text
_body1351:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r10
	movq	(%r8 ), %r9 
	movq	%r10, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rsi
	pushq	%rdx
	movq	%r9 , %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%r10, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r9 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdi
	movq	(%rsi), %rdx
	movq	%rdx, (%rdi)
	movq	(%r8 ), %rdx
	movq	%rdx, %rdi
	addq	$1, %rdi
	movq	%rdi, (%r8 )
	jmp	_cond1352
	.text
_cond1332:
	movq	(%r9 ), %rdx
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	cmpq	-32(%rbp), %rdx
	setl	%r10b
	andq	$1, %r10
	cmpq	$0, %r10
	jne	_body1331
	jmp	_post1330
	.text
_cond1352:
	movq	(%r8 ), %rdx
	cmpq	$3, %rdx
	setl	%dil
	andq	$1, %rdi
	cmpq	$0, %rdi
	jne	_body1351
	jmp	_post1350
	.text
_post1330:
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond1352
	.text
_post1350:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	%rsi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	
	.text
	.globl	program
program:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$136, %rsp
	subq	$8, %rsp
	movq	%rsp, -8(%rbp)
	subq	$8, %rsp
	movq	%rsp, -16(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r10
	subq	$8, %rsp
	movq	%rsp, %r9 
	subq	$8, %rsp
	movq	%rsp, -24(%rbp)
	subq	$8, %rsp
	movq	%rsp, %r8 
	subq	$8, %rsp
	movq	%rsp, %rdi
	subq	$8, %rsp
	movq	%rsp, -32(%rbp)
	subq	$8, %rsp
	movq	%rsp, %rsi
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -40(%rbp)
	subq	$8, %rsp
	movq	%rsp, -48(%rbp)
	movq	$3, %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %r11
	movq	-40(%rbp), %rax
	movq	%r11, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond1184
	.text
_body1183:
	movq	%r11, %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	-64(%rbp), %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-56(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	_cond1184
	.text
_body1203:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -80(%rbp)
	movq	(%r10), %r11
	movq	-80(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r11, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-80(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r11, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%r10), %r11
	movq	%r11, (%rdx)
	movq	(%r10), %rdx
	movq	%rdx, %r11
	addq	$1, %r11
	movq	%r11, (%r10)
	jmp	_cond1204
	.text
_body1225:
	movq	%r10, %rax
	movq	(%rax), %rax
	movq	%rax, -88(%rbp)
	movq	(%r9 ), %r11
	movq	-88(%rbp), %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r11, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	-88(%rbp), %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r11, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	(%r9 ), %rdx
	movq	%rdx, %r11
	addq	$1, %r11
	movq	%r11, (%r9 )
	jmp	_cond1226
	.text
_body1245:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r10
	movq	(%r8 ), %r9 
	movq	%r10, %rax
	movq	%rax, %rdx
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r9 , %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	movq	%r10, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r9 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%r8 ), %r10
	movq	(%r8 ), %r9 
	movq	%r10, %r11
	imulq	%r9 , %r11
	movq	%r11, (%rdx)
	movq	(%r8 ), %rdx
	movq	%rdx, %r9 
	addq	$1, %r9 
	movq	%r9 , (%r8 )
	jmp	_cond1246
	.text
_body1269:
	movq	(%r8 ), %r10
	movq	(%rdi), %r9 
	movq	%r10, %rax
	movq	%rax, %rdx
	pushq	%r11
	pushq	%r10
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%r9 , %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	popq	%r10
	popq	%r11
	movq	%r10, %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%r9 , %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	$0, %rax
	movq	%rdx, %rcx
	movq	%rax, (%rcx)
	movq	(%rdi), %rdx
	movq	%rdx, %r9 
	addq	$1, %r9 
	movq	%r9 , (%rdi)
	jmp	_cond1270
	.text
_body1289:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r8 
	movq	(%rsi), %rdi
	movq	%r8 , %rax
	movq	%rax, %rdx
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	%rdi, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	popq	%r8 
	movq	%r8 , %rax
	addq	$0, %rax
	addq	$8, %rax
	movq	%rax, %rcx
	movq	%rdi, %rax
	imulq	$8, %rax
	addq	%rcx, %rax
	movq	%rax, %rdx
	movq	(%rsi), %rdi
	movq	$2, %r8 
	imulq	%rdi, %r8 
	movq	%r8 , (%rdx)
	movq	(%rsi), %rdx
	movq	%rdx, %rdi
	addq	$1, %rdi
	movq	%rdi, (%rsi)
	jmp	_cond1290
	.text
_cond1184:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -96(%rbp)
	cmpq	-96(%rbp), %rdx
	setl	-104(%rbp)
	andq	$1, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	_body1183
	jmp	_post1182
	.text
_cond1204:
	movq	(%r10), %rdx
	cmpq	$3, %rdx
	setl	%r11b
	andq	$1, %r11
	cmpq	$0, %r11
	jne	_body1203
	jmp	_post1202
	.text
_cond1226:
	movq	(%r9 ), %rdx
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r11
	cmpq	%r11, %rdx
	setl	-112(%rbp)
	andq	$1, -112(%rbp)
	cmpq	$0, -112(%rbp)
	jne	_body1225
	jmp	_post1224
	.text
_cond1246:
	movq	(%r8 ), %rdx
	cmpq	$4, %rdx
	setl	%r9b
	andq	$1, %r9 
	cmpq	$0, %r9 
	jne	_body1245
	jmp	_post1244
	.text
_cond1270:
	movq	(%rdi), %rdx
	movq	-136(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %r9 
	cmpq	%r9 , %rdx
	setl	%r10b
	andq	$1, %r10
	cmpq	$0, %r10
	jne	_body1269
	jmp	_post1268
	.text
_cond1290:
	movq	(%rsi), %rdx
	cmpq	$3, %rdx
	setl	%dil
	andq	$1, %rdi
	cmpq	$0, %rdi
	jne	_body1289
	jmp	_post1288
	.text
_post1182:
	movq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	jmp	_cond1204
	.text
_post1202:
	pushq	%r9 
	pushq	%r8 
	pushq	%rdi
	pushq	%rsi
	movq	$4, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	popq	%r8 
	popq	%r9 
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, -120(%rbp)
	subq	$8, %rsp
	movq	%rsp, -128(%rbp)
	movq	$4, %rax
	movq	-128(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %r10
	movq	-120(%rbp), %rax
	movq	%r10, %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r9 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond1226
	.text
_post1224:
	movq	-120(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%r8 , %rcx
	movq	%rax, (%rcx)
	jmp	_cond1246
	.text
_post1244:
	pushq	%rdi
	pushq	%rsi
	movq	$3, %rdi
	callq	oat_alloc_array
	popq	%rsi
	popq	%rdi
	movq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %r11
	subq	$8, %rsp
	movq	%rsp, -136(%rbp)
	movq	$3, %rax
	movq	-136(%rbp), %rcx
	movq	%rax, (%rcx)
	subq	$8, %rsp
	movq	%rsp, %r8 
	movq	%r11, (%r8 )
	movq	$0, %rax
	movq	%rdi, %rcx
	movq	%rax, (%rcx)
	jmp	_cond1270
	.text
_post1268:
	movq	%r11, %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	$0, %rax
	movq	%rsi, %rcx
	movq	%rax, (%rcx)
	jmp	_cond1290
	.text
_post1288:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rsi
	pushq	%rdx
	movq	$3, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$24, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rdi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movq	%rsi, %rax
	movq	%rax, %rdx
	pushq	%rdi
	pushq	%rsi
	pushq	%rdx
	movq	$1, %rsi
	movq	%rdx, %rdi
	callq	oat_assert_array_length
	popq	%rdx
	popq	%rsi
	popq	%rdi
	movq	%rsi, %rax
	addq	$0, %rax
	addq	$8, %rax
	addq	$8, %rax
	movq	%rax, %rdx
	movq	(%rdx), %rsi
	movq	%rdi, %r8 
	addq	%rsi, %r8 
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	pushq	%r8 
	pushq	%rsi
	movq	%rsi, %rdi
	callq	f
	popq	%rsi
	popq	%r8 
	movq	%rax, %rdx
	movq	%r8 , %rsi
	addq	%rdx, %rsi
	pushq	%rsi
	movq	$4, %rdi
	callq	g
	popq	%rsi
	movq	%rax, %rdx
	movq	%rsi, %rdi
	addq	%rdx, %rdi
	movq	%rdi, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq	