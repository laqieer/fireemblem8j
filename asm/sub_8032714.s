	.syntax unified
	.set GetFacingDirection, 0x0807DD00 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SetMuMoveScript, 0x0807ABB4 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_8032700, 0x08032700 + 1
	.set sub_8037B04, 0x08037B04 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807B9B0, 0x0807B9B0 + 1
	.section .text.sub_8032714, "ax", %progbits
@ sub_8032714 @ JP 0x08032714 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8032714
	.thumb_func
sub_8032714:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x54]
	ldr r7, _0803279C @ =0x0203A4E8
	adds r0, r7, #0
	bl sub_8032700
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803273E
	ldr r0, _080327A0 @ =0x08A132D0
	bl Proc_Find
	adds r4, r0, #0
	bl sub_807B9B0
	str r4, [r6, #0x54]
	adds r0, r7, #0
	bl sub_8037B04
_0803273E:
	ldr r5, _080327A4 @ =0x0203A568
	adds r0, r5, #0
	bl sub_8032700
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08032796
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl sub_8037B04
	bl sub_8027144
	adds r0, r5, #0
	bl sub_807A888
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetFacingDirection
	ldr r1, _080327A8 @ =0x02033EF8
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl SetMuMoveScript
	adds r0, r4, #0
	bl sub_807B9B0
	str r4, [r6, #0x54]
_08032796:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803279C: .4byte 0x0203A4E8
_080327A0: .4byte 0x08A132D0
_080327A4: .4byte 0x0203A568
_080327A8: .4byte 0x02033EF8

