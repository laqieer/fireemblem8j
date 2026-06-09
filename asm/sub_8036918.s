	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetItemIndex, 0x08017294 + 1
	.set PutText, 0x08003DA0 + 1
	.set PutTwoSpecialChar, 0x08004C64 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8004ABC, 0x08004ABC + 1
	.set sub_80366E4, 0x080366E4 + 1
	.set sub_8036728, 0x08036728 + 1
	.section .text.sub_8036918, "ax", %progbits
@ sub_8036918 @ JP 0x08036918 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036918
	.thumb_func
sub_8036918:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _0803699C @ =0x0200422C
	ldr r1, _080369A0 @ =0x085C8EC8
	movs r2, #0x80
	lsls r2, r2, #5
	bl j_TmApplyTsa
	ldr r4, _080369A4 @ =0x02003D2C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xf
	movs r3, #0
	bl j_TmFillRect
	adds r0, r4, #0
	adds r0, #0x46
	adds r5, r6, #0
	adds r5, #0x38
	ldr r2, _080369A8 @ =0x0203A4E8
	adds r1, r5, #0
	bl sub_80366E4
	ldr r1, _080369AC @ =0x000002C2
	adds r0, r4, r1
	ldr r7, _080369B0 @ =0x0203A568
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_80366E4
	ldr r2, _080369B4 @ =0x00000342
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
	bne _080369B8
	adds r0, r7, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080369B8
	movs r3, #1
	rsbs r3, r3, #0
	mov r8, r3
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r2, r7, #0
	b _080369D6
	.align 2, 0
_0803699C: .4byte 0x0200422C
_080369A0: .4byte 0x085C8EC8
_080369A4: .4byte 0x02003D2C
_080369A8: .4byte 0x0203A4E8
_080369AC: .4byte 0x000002C2
_080369B0: .4byte 0x0203A568
_080369B4: .4byte 0x00000342
_080369B8:
	ldr r2, _080369EC @ =0x0203A568
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _080369F0 @ =0x0203A4E8
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r1, r1, r0
	mov r8, r1
	cmp r1, #0
	bge _080369D6
	movs r0, #0
	mov r8, r0
_080369D6:
	adds r2, #0x72
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x63
	ble _080369F8
	ldr r0, _080369F4 @ =0x02003DF0
	movs r1, #2
	movs r2, #0xff
	bl sub_8004ABC
	b _08036A06
	.align 2, 0
_080369EC: .4byte 0x0203A568
_080369F0: .4byte 0x0203A4E8
_080369F4: .4byte 0x02003DF0
_080369F8:
	ldr r0, _08036AA0 @ =0x02003DF0
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #2
	bl sub_8004ABC
_08036A06:
	ldr r7, _08036AA4 @ =0x02003E70
	adds r0, r7, #0
	movs r1, #2
	mov r2, r8
	bl sub_8004ABC
	adds r0, r7, #0
	adds r0, #0x80
	ldr r4, _08036AA8 @ =0x0203A568
	adds r1, r4, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_8004ABC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r1, r4, #0
	adds r1, #0x6a
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_8004ABC
	ldr r5, _08036AAC @ =0x0203A4E8
	adds r0, r5, #0
	adds r0, #0x5a
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r1, r1, r0
	mov r8, r1
	adds r6, r5, #0
	adds r6, #0x48
	ldrh r0, [r6]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _08036A62
	movs r0, #0xff
	mov r8, r0
_08036A62:
	mov r1, r8
	cmp r1, #0
	bge _08036A6C
	movs r2, #0
	mov r8, r2
_08036A6C:
	adds r0, r5, #0
	adds r0, #0x6a
	movs r3, #0
	ldrsh r4, [r0, r3]
	ldrh r0, [r6]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _08036A80
	movs r4, #0xff
_08036A80:
	cmp r4, #0
	bge _08036A86
	movs r4, #0
_08036A86:
	adds r1, r5, #0
	adds r1, #0x72
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x63
	ble _08036AB0
	adds r0, r7, #0
	subs r0, #0x74
	movs r1, #2
	movs r2, #0xff
	bl sub_8004ABC
	b _08036ABE
	.align 2, 0
_08036AA0: .4byte 0x02003DF0
_08036AA4: .4byte 0x02003E70
_08036AA8: .4byte 0x0203A568
_08036AAC: .4byte 0x0203A4E8
_08036AB0:
	adds r0, r7, #0
	subs r0, #0x74
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl sub_8004ABC
_08036ABE:
	ldr r6, _08036B5C @ =0x02003E7C
	adds r0, r6, #0
	movs r1, #2
	mov r2, r8
	bl sub_8004ABC
	adds r0, r6, #0
	adds r0, #0x80
	ldr r5, _08036B60 @ =0x0203A4E8
	adds r1, r5, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #2
	bl sub_8004ABC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r1, #2
	adds r2, r4, #0
	bl sub_8004ABC
	adds r0, r6, #0
	subs r0, #0x88
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r4, _08036B64 @ =0x02002FDC
	adds r1, r6, #0
	subs r1, #0xa
	adds r0, r4, #0
	bl PutText
	adds r0, r4, #0
	adds r0, #8
	adds r1, r6, #0
	adds r1, #0x76
	bl PutText
	adds r4, #0x10
	adds r1, r6, #0
	adds r1, #0xf6
	adds r0, r4, #0
	bl PutText
	movs r2, #0xbf
	lsls r2, r2, #1
	adds r4, r6, r2
	ldr r0, _08036B68 @ =0x0203A568
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	ldr r3, _08036B6C @ =0xFFFFFEF2
	adds r4, r6, r3
	adds r5, #0x4a
	ldrh r0, [r5]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r0, r4, #0
	bl DrawIcon
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036B5C: .4byte 0x02003E7C
_08036B60: .4byte 0x0203A4E8
_08036B64: .4byte 0x02002FDC
_08036B68: .4byte 0x0203A568
_08036B6C: .4byte 0xFFFFFEF2

