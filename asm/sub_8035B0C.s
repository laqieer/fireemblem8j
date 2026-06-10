	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8018110, 0x08018110 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807B9B0, 0x0807B9B0 + 1
	.section .text.sub_8035B0C, "ax", %progbits
@ sub_8035B0C @ JP 0x08035B0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035B0C
	.thumb_func
sub_8035B0C:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x4c
	movs r0, #0
	ldrsh r4, [r6, r0]
	bl GetSelectTargetCount
	cmp r4, r0
	bne _08035B2A
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _08035B9E
_08035B2A:
	movs r1, #0
	ldrsh r0, [r6, r1]
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	bl sub_80280A0
	adds r0, r4, #0
	bl sub_8018110
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	lsls r2, r2, #4
	ldr r1, _08035B84 @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	cmp r2, #0xf0
	bhi _08035B6E
	cmp r0, #0
	blt _08035B6E
	cmp r0, #0xa0
	ble _08035B88
_08035B6E:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08035B9E
	.align 2, 0
_08035B84: .4byte 0x0202BCAC
_08035B88:
	adds r0, r4, #0
	bl sub_807A888
	bl sub_807B9B0
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	adds r0, r5, #0
	bl sub_8002DE4
_08035B9E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

