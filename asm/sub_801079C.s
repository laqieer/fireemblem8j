	.syntax unified
	.set ChangeUnitAi, 0x08011DB0 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8011DF4, 0x08011DF4 + 1
	.section .text.sub_801079C, "ax", %progbits
@ sub_801079C @ JP 0x0801079C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801079C
	.thumb_func
sub_801079C:
	push {r4, r5, r6, r7, lr}
	ldr r2, [r0, #0x38]
	ldrb r0, [r2]
	movs r3, #0xf
	ands r3, r0
	ldr r4, _080107C4 @ =0x030004B0
	ldr r1, [r4, #4]
	ldrb r7, [r4, #4]
	lsrs r0, r1, #8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsrs r1, r1, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r3, #0
	beq _080107C8
	cmp r3, #1
	beq _080107E4
	b _0801082C
	.align 2, 0
_080107C4: .4byte 0x030004B0
_080107C8:
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _080107D4
	movs r1, #8
	ldrsh r0, [r4, r1]
_080107D4:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_8011DF4
	b _0801082C
_080107E4:
	ldrh r0, [r2, #2]
	movs r3, #2
	ldrsb r3, [r2, r3]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x18
	cmp r3, #0
	blt _080107F6
	cmp r2, #0
	bge _08010802
_080107F6:
	ldrh r0, [r4, #0x2c]
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
_08010802:
	ldr r0, _0801081C @ =0x0202E4D4
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _08010820
	bl GetUnit
	b _08010822
	.align 2, 0
_0801081C: .4byte 0x0202E4D4
_08010820:
	movs r0, #0
_08010822:
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl ChangeUnitAi
_0801082C:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

