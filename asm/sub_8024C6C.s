	.syntax unified
	.set sub_803830C, 0x0803830C + 1
	.section .text.sub_8024C6C, "ax", %progbits
@ sub_8024C6C @ JP 0x08024C6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024C6C
	.thumb_func
sub_8024C6C:
	push {lr}
	movs r0, #3
	bl sub_803830C
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

