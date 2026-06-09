	.syntax unified
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80358A8, 0x080358A8 + 1
	.section .text.sub_8036574, "ax", %progbits
@ sub_8036574 @ JP 0x08036574 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036574
	.thumb_func
sub_8036574:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #5
	bgt _080365A6
	adds r2, r0, #0
	rsbs r2, r2, #0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_80358A8
	b _080365B8
_080365A6:
	movs r2, #3
	ldrsb r2, [r4, r2]
	rsbs r2, r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80358A8
_080365B8:
	adds r0, r5, #0
	bl sub_8018E64
	cmp r0, #0
	bgt _080365C6
	bl sub_8027144
_080365C6:
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

