	.syntax unified
	.set sub_8086350, 0x08086350 + 1
	.section .text.sub_80854E4, "ax", %progbits
@ sub_80854E4 @ JP 0x080854E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80854E4
	.thumb_func
sub_80854E4:
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8086350
	cmp r0, #0x14
	beq _080854FA
	movs r0, #0
	b _080854FC
_080854FA:
	movs r0, #1
_080854FC:
	pop {r1}
	bx r1

