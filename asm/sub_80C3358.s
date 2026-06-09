	.syntax unified
	.set InitTextDb, 0x08003CB4 + 1
	.section .text.sub_80C3358, "ax", %progbits
@ sub_80C3358 @ JP 0x080C3358 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3358
	.thumb_func
sub_80C3358:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #6
	bl InitTextDb
	movs r1, #0
	str r1, [r4, #0x58]
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

