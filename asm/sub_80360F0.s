	.syntax unified
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_803594C, 0x0803594C + 1
	.section .text.sub_80360F0, "ax", %progbits
@ sub_80360F0 @ JP 0x080360F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80360F0
	.thumb_func
sub_80360F0:
	push {r4, r5, lr}
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	bl sub_80280A0
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl sub_803594C
	pop {r4, r5}
	pop {r0}
	bx r0

