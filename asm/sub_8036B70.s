	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set PutText, 0x08003DA0 + 1
	.set PutTwoSpecialChar, 0x08004C64 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8004ABC, 0x08004ABC + 1
	.set sub_80366E4, 0x080366E4 + 1
	.set sub_8036728, 0x08036728 + 1
	.section .text.sub_8036B70, "ax", %progbits
@ sub_8036B70 @ JP 0x08036B70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036B70
	.thumb_func
sub_8036B70:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _08036C04 @ =0x0200422C
	ldr r1, _08036C08 @ =0x085C900C
	movs r2, #0x80
	lsls r2, r2, #5
	bl j_TmApplyTsa
	ldr r4, _08036C0C @ =0x02003D2C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x13
	movs r3, #0
	bl j_TmFillRect
	adds r0, r4, #0
	adds r0, #0x46
	adds r5, r6, #0
	adds r5, #0x38
	ldr r2, _08036C10 @ =0x0203A4E8
	adds r1, r5, #0
	bl sub_80366E4
	ldr r1, _08036C14 @ =0x000003C2
	adds r0, r4, r1
	ldr r7, _08036C18 @ =0x0203A568
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_80366E4
	ldr r2, _08036C1C @ =0x00000442
	adds r4, r4, r2
	adds r6, #0x48
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8036728
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _08036BE8
	adds r0, r7, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08036BE8
	adds r1, r7, #0
	adds r1, #0x5a
	movs r0, #0xff
	strh r0, [r1]
	adds r1, #0xa
	strh r0, [r1]
	adds r1, #6
	strh r0, [r1]
_08036BE8:
	ldr r0, _08036C18 @ =0x0203A568
	adds r1, r0, #0
	adds r1, #0x72
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x63
	ble _08036C24
	ldr r0, _08036C20 @ =0x02003DF0
	movs r1, #2
	movs r2, #0xff
	bl sub_8004ABC
	b _08036C30
	.align 2, 0
_08036C04: .4byte 0x0200422C
_08036C08: .4byte 0x085C900C
_08036C0C: .4byte 0x02003D2C
_08036C10: .4byte 0x0203A4E8
_08036C14: .4byte 0x000003C2
_08036C18: .4byte 0x0203A568
_08036C1C: .4byte 0x00000442
_08036C20: .4byte 0x02003DF0
_08036C24:
	ldr r0, _08036CB0 @ =0x02003DF0
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl sub_8004ABC
_08036C30:
	ldr r5, _08036CB4 @ =0x02003E70
	ldr r4, _08036CB8 @ =0x0203A568
	adds r0, r4, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, r5, #0
	movs r1, #2
	bl sub_8004ABC
	adds r0, r5, #0
	adds r0, #0x80
	adds r1, r4, #0
	adds r1, #0x5c
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_8004ABC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_8004ABC
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_8004ABC
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, r4, #0
	adds r1, #0x5e
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_8004ABC
	ldr r0, _08036CBC @ =0x0203A4E8
	adds r1, r0, #0
	adds r1, #0x72
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x63
	ble _08036CC0
	adds r0, r5, #0
	subs r0, #0x74
	movs r1, #2
	movs r2, #0xff
	bl sub_8004ABC
	b _08036CCE
	.align 2, 0
_08036CB0: .4byte 0x02003DF0
_08036CB4: .4byte 0x02003E70
_08036CB8: .4byte 0x0203A568
_08036CBC: .4byte 0x0203A4E8
_08036CC0:
	adds r0, r5, #0
	subs r0, #0x74
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl sub_8004ABC
_08036CCE:
	ldr r5, _08036DB8 @ =0x02003E7C
	ldr r6, _08036DBC @ =0x0203A4E8
	adds r0, r6, #0
	adds r0, #0x5a
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r0, r5, #0
	movs r1, #2
	bl sub_8004ABC
	adds r0, r5, #0
	adds r0, #0x80
	adds r1, r6, #0
	adds r1, #0x5c
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_8004ABC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_8004ABC
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_8004ABC
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, r6, #0
	adds r1, #0x5e
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_8004ABC
	adds r0, r5, #0
	subs r0, #0x88
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r4, _08036DC0 @ =0x02002FF4
	adds r1, r5, #0
	subs r1, #0xa
	adds r0, r4, #0
	bl PutText
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #0
	adds r1, #0x76
	bl PutText
	adds r0, r4, #0
	subs r0, #0x10
	adds r1, r5, #0
	adds r1, #0xf6
	bl PutText
	adds r0, r4, #0
	subs r0, #8
	movs r2, #0xbb
	lsls r2, r2, #1
	adds r1, r5, r2
	bl PutText
	adds r0, r4, #0
	adds r0, #0x10
	movs r3, #0xfb
	lsls r3, r3, #1
	adds r1, r5, r3
	bl PutText
	ldr r0, _08036DC4 @ =0x0000027E
	adds r4, r5, r0
	ldr r0, _08036DC8 @ =0x0203A568
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	ldr r1, _08036DCC @ =0xFFFFFEF2
	adds r4, r5, r1
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r0, r4, #0
	bl DrawIcon
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036DB8: .4byte 0x02003E7C
_08036DBC: .4byte 0x0203A4E8
_08036DC0: .4byte 0x02002FF4
_08036DC4: .4byte 0x0000027E
_08036DC8: .4byte 0x0203A568
_08036DCC: .4byte 0xFFFFFEF2

