	.text
	.file	"test_new_array_7.ll"
	.globl	program                         # -- Begin function program
	.p2align	4, 0x90
	.type	program,@function
program:                                # @program
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$5, %edi
	callq	oat_alloc_array@PLT
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB0_1:                                # %_body4
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, 8(%rax,%rcx,8)
	addq	$1, %rcx
	cmpq	$5, %rcx
	jne	.LBB0_1
# %bb.2:                                # %_post3
	movq	%rax, %rdi
	callq	string_of_array@PLT
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	program, .Lfunc_end0-program
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
	.addrsig
