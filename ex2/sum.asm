
sum: 
	pushq %rbp
	moveq $0, %rax
loop:   
	cmpq $1, %rdi
	jlt end
	addq %rdi, %rax
	subq $1, %rdi
	jmp loop
end:	
	popq %rbp
	


