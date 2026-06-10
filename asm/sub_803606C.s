	.syntax unified
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_80358A8, 0x080358A8 + 1
	.section .text.sub_803606C, "ax", %progbits
@ sub_803606C @ JP 0x0803606C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803606C
	.thumb_func
sub_803606C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _0803609A
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_80358A8
	b _080360A8
_0803609A:
	movs r2, #3
	ldrsb r2, [r4, r2]
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r5, #0
	bl sub_80358A8
_080360A8:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

