	.text
	.file	"test_new_array_9.ll"
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
	movq	$0, 8(%rax)
	movq	$1, 16(%rax)
	movq	$2, 24(%rax)
	movq	$3, 32(%rax)
	movq	$4, 40(%rax)
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
