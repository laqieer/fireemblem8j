	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_80325C0, 0x080325C0 + 1
	.set sub_8032674, 0x08032674 + 1
	.section .text.sub_80327B8, "ax", %progbits
@ sub_80327B8 @ JP 0x080327B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80327B8
	.thumb_func
sub_80327B8:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_80325C0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80325C0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8032674
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8032674
	pop {r4, r5, r6}
	pop {r0}
	bx r0

