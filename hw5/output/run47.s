	.text
	.file	"run47.ll"
	.globl	f                               # -- Begin function f
	.p2align	4, 0x90
	.type	f,@function
f:                                      # @f
# %bb.0:
	movq	a@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	addq	$1, %rax
	movq	%rax, (%rcx)
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	callq	f@PLT
	movq	%rax, %rdi
	callq	oat_alloc_array@PLT
	movq	%rax, %r15
	callq	f@PLT
	testq	%rax, %rax
	jle	.LBB1_3
# %bb.1:                                # %_body9.preheader
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB1_2:                                # %_body9
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, 8(%r15,%rbx,8)
	addq	$1, %rbx
	callq	f@PLT
	cmpq	%rax, %rbx
	jl	.LBB1_2
.LBB1_3:                                # %_post8
	movq	a@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	movq	%r15, %rdi
	xorl	%esi, %esi
	callq	oat_assert_array_length@PLT
	addq	8(%r15), %r14
	movl	$1, %esi
	movq	%r15, %rdi
	callq	oat_assert_array_length@PLT
	addq	16(%r15), %r14
	movq	%r14, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
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
