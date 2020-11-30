	.text
	.file	"run47_1.ll"
	.globl	f                               # -- Begin function f
	.p2align	4, 0x90
	.type	f,@function
f:                                      # @f
# %bb.0:
	movl	$1, %eax
	retq
.Lfunc_end0:
	.size	f, .Lfunc_end0-f
                                        # -- End function
	.globl	program                         # -- Begin function program
	.p2align	4, 0x90
	.type	program,@function
program:                                # @program
	.cfi_startproc
# %bb.0:                                # %_cond10
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$1, %edi
	callq	oat_alloc_array@PLT
	movq	%rax, %r14
	movq	$0, 8(%rax)
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
