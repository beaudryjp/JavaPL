.method public static main(I)I
	sipush 0
	istore 1
	sipush 0
	istore 2
	sipush 5
	dup
	istore 1
	pop
	sipush 10
	dup
	istore 2
	pop
	iload 0
	iload 1
	isub
	iflt L1
	goto L2
L1:
	iload 0
	iload 0
	imul
	iload 2
	isub
	iflt L4
	goto L5
L4:
	sipush 10
	dup
	istore 1
	pop
	goto L3
L5:
	sipush 0
	dup
	istore 1
	pop
L3:
	goto L0
L2:
L0:
	iload 1
	iload 2
	iadd
	ireturn
	nop
	.limit stack 5
	.limit locals 3
.end method
