	.syntax unified
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8024C7C, "ax", %progbits
@ sub_8024C7C @ JP 0x08024C7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024C7C
	.thumb_func
sub_8024C7C:
	push {lr}
	bl sub_80C1E74
	cmp r0, #0
	beq _08024C8A
	movs r0, #1
	b _08024C8C
_08024C8A:
	movs r0, #3
_08024C8C:
	pop {r1}
	bx r1

