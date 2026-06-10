	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.section .text.sub_80363A4, "ax", %progbits
@ sub_80363A4 @ JP 0x080363A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80363A4
	.thumb_func
sub_80363A4:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _080363DC @ =0x0203A954
	ldrb r0, [r5, #2]
	strb r0, [r1, #0xc]
	movs r0, #0
	ldrsh r4, [r4, r0]
	bl GetSelectTargetCount
	cmp r4, r0
	bne _080363E0
	adds r0, r7, #0
	bl Proc_End
	b _0803642E
	.align 2, 0
_080363DC: .4byte 0x0203A954
_080363E0:
	movs r0, #2
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0803642E
	ldr r0, _08036414 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0803641C
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	ldr r1, _08036418 @ =0x0202E4E4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803641C
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _0803642E
	.align 2, 0
_08036414: .4byte 0x0202BCEC
_08036418: .4byte 0x0202E4E4
_0803641C:
	adds r0, r6, #0
	bl sub_8018E64
	cmp r0, #0
	bne _0803642E
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_0803642E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

