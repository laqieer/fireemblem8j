	.syntax unified
	.set sub_80034D0, 0x080034D0 + 1
	.section .text.sub_80034C4, "ax", %progbits
@ sub_80034C4 @ JP 0x080034C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80034C4
	.thumb_func
sub_80034C4:
	push {lr}
	bl sub_80034D0
	pop {r0}
	bx r0
	.align 2, 0

