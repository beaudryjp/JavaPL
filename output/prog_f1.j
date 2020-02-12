.method public static main(I)I
	sipush 0
	istore 1
	sipush 5
	dup
	istore 1
	pop
	iload 1
	iload 0
	isub
	iflt L1
	goto L2
L1:
	iload 0
	dup
	istore 1
	pop
	goto L0
L2:
L0:
	iload 1
	ireturn
	nop
	.limit stack 3
	.limit locals 2
.end method
