.method public static main(I)I
	sipush 0
	istore 1
	iload 0
	dup
	istore 1
	pop
	sipush 0
	istore 2
	iload 1
	iload 1
	iadd
	dup
	istore 2
	pop
	sipush 0
	istore 3
	iload 2
	iload 2
	iadd
	dup
	istore 3
	pop
	sipush 0
	istore 4
	iload 3
	iload 3
	iadd
	dup
	istore 4
	pop
	iload 4
	dup
	istore 1
	pop
	iload 1
	iload 2
	iadd
	iload 3
	iadd
	dup
	istore 1
	pop
	iload 1
	ireturn
	nop
	.limit stack 7
	.limit locals 5
.end method
