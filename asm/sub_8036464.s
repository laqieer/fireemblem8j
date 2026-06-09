	.syntax unified
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set StartArrowTrapAnim, 0x0801F49C + 1
	.set StartFireTrapAnim, 0x0801F2E4 + 1
	.set StartGasTrapAnim, 0x0801F258 + 1
	.set sub_801F520, 0x0801F520 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_803594C, 0x0803594C + 1
	.set sub_8035A2C, 0x08035A2C + 1
	.section .text.sub_8036464, "ax", %progbits
@ sub_8036464 @ JP 0x08036464 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036464
	.thumb_func
sub_8036464:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	ldrb r1, [r4, #2]
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08036532
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0x64
	beq _080364BC
	cmp r0, #0x64
	bgt _0803649E
	cmp r0, #6
	beq _08036510
	cmp r0, #6
	bgt _08036498
	cmp r0, #4
	beq _080364AC
	b _0803651E
_08036498:
	cmp r0, #7
	beq _08036504
	b _0803651E
_0803649E:
	cmp r0, #0x66
	beq _080364E0
	cmp r0, #0x66
	blt _080364CE
	cmp r0, #0x67
	beq _080364F2
	b _0803651E
_080364AC:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl StartFireTrapAnim
	b _0803651E
_080364BC:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #3
	bl StartGasTrapAnim
	b _0803651E
_080364CE:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #2
	bl StartGasTrapAnim
	b _0803651E
_080364E0:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #0
	bl StartGasTrapAnim
	b _0803651E
_080364F2:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #1
	bl StartGasTrapAnim
	b _0803651E
_08036504:
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r5, #0
	bl StartArrowTrapAnim
	b _0803651E
_08036510:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl sub_801F520
_0803651E:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _0803656E
_08036532:
	ldr r5, _0803655C @ =0x0203A954
	strb r1, [r5, #0xc]
	ldrb r0, [r4, #3]
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl sub_80280A0
	ldrb r0, [r5, #0x15]
	cmp r0, #5
	bhi _08036560
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #3
	ldrsb r1, [r4, r1]
	bl sub_803594C
	b _0803656E
	.align 2, 0
_0803655C: .4byte 0x0203A954
_08036560:
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #3
	ldrsb r1, [r4, r1]
	bl sub_8035A2C
_0803656E:
	pop {r4, r5}
	pop {r0}
	bx r0

