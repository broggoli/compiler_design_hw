	.text
	.file	"run47_5.ll"
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	callq	f@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	oat_alloc_array@PLT
	movq	%rax, %r14
	testq	%rbx, %rbx
	jle	.LBB1_3
# %bb.1:                                # %_body9.preheader
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_2:                                # %_body9
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, 8(%r14,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.LBB1_2
.LBB1_3:                                # %_post8
	movq	a@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
	movq	%r14, %rdi
	xorl	%esi, %esi
	callq	oat_assert_array_length@PLT
	addq	8(%r14), %rbx
	movl	$1, %esi
	movq	%r14, %rdi
	callq	oat_assert_array_length@PLT
	addq	16(%r14), %rbx
	movq	%rbx, %rax
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
