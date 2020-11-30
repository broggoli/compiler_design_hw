	.text
	.file	"run47_2.ll"
	.globl	f                               # -- Begin function f
	.p2align	4, 0x90
	.type	f,@function
f:                                      # @f
# %bb.0:
	movl	$2, %eax
	retq
.Lfunc_end0:
	.size	f, .Lfunc_end0-f
                                        # -- End function
	.globl	program                         # -- Begin function program
	.p2align	4, 0x90
	.type	program,@function
program:                                # @program
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$2, %edi
	callq	oat_alloc_array@PLT
	movq	%rax, %rbx
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_1:                                # %_body9
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, 8(%rbx,%rax,8)
	addq	$1, %rax
	cmpq	$2, %rax
	jne	.LBB1_1
# %bb.2:                                # %_post8
	movq	a@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	movq	%rbx, %rdi
	xorl	%esi, %esi
	callq	oat_assert_array_length@PLT
	addq	8(%rbx), %r14
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	oat_assert_array_length@PLT
	addq	16(%rbx), %r14
	movq	%r14, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	program, .Lfunc_end1-program
	.cfi_endproc
                                        # -- End function
	.type	a,@object                       # @a
	.data
	.globl	a
	.p2align	3
a:
	.quad	1                               # 0x1
	.size	a, 8

	.section	".note.GNU-stack","",@progbits
	.addrsig
