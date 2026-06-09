	.syntax unified
	.set DisableEkrGauge, 0x08051F5C + 1
	.set EkrGauge_Clr323A, 0x08051F04 + 1
	.set EkrGauge_Clr4C50, 0x08051EB4 + 1
	.set EkrGauge_ClrInitFlag, 0x08051F3C + 1
	.set EkrGauge_Setup44, 0x08051EF4 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003520, 0x08003520 + 1
	.set sub_8003678, 0x08003678 + 1
	.set sub_8051BC4, 0x08051BC4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6370, 0x080D6370 + 1
	.set sub_80D6390, 0x080D6390 + 1
	.section .text.sub_8051C2C, "ax", %progbits
@ sub_8051C2C @ JP 0x08051C2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051C2C
	.thumb_func
sub_8051C2C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r4, _08051C78 @ =0x02000068
	ldr r0, _08051C7C @ =0x085E3598
	movs r1, #1
	bl sub_8002BCC
	str r0, [r4]
	movs r0, #0
	bl EkrGauge_Setup44
	bl EkrGauge_Clr4C50
	bl DisableEkrGauge
	bl EkrGauge_ClrInitFlag
	ldr r1, _08051C80 @ =0x02000038
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl EkrGauge_Clr323A
	ldr r0, _08051C84 @ =0x0203E1A8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble _08051C90
	ldr r0, _08051C88 @ =0x088571DC
	ldr r1, _08051C8C @ =0x02022C08
	movs r2, #0x10
	bl sub_80D6370
	b _08051CA4
	.align 2, 0
_08051C78: .4byte 0x02000068
_08051C7C: .4byte 0x085E3598
_08051C80: .4byte 0x02000038
_08051C84: .4byte 0x0203E1A8
_08051C88: .4byte 0x088571DC
_08051C8C: .4byte 0x02022C08
_08051C90:
	ldr r0, _08051CBC @ =0x0203E110
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, _08051CC0 @ =0x0885705C
	adds r0, r0, r1
	ldr r1, _08051CC4 @ =0x02022C08
	movs r2, #0x10
	bl sub_80D6370
_08051CA4:
	ldr r0, _08051CC8 @ =0x0203E1A8
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble _08051CD4
	ldr r0, _08051CCC @ =0x088571DC
	ldr r1, _08051CD0 @ =0x02022C28
	movs r2, #0x10
	bl sub_80D6370
	b _08051CE8
	.align 2, 0
_08051CBC: .4byte 0x0203E110
_08051CC0: .4byte 0x0885705C
_08051CC4: .4byte 0x02022C08
_08051CC8: .4byte 0x0203E1A8
_08051CCC: .4byte 0x088571DC
_08051CD0: .4byte 0x02022C28
_08051CD4:
	ldr r0, _08051E3C @ =0x0203E110
	movs r2, #2
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, _08051E40 @ =0x0885705C
	adds r0, r0, r1
	ldr r1, _08051E44 @ =0x02022C28
	movs r2, #0x10
	bl sub_80D6370
_08051CE8:
	ldr r1, _08051E48 @ =0x0203E1B0
	ldr r0, _08051E4C @ =0x0000FFFF
	strh r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	ldr r0, _08051E50 @ =0x08856B30
	ldr r1, _08051E54 @ =0x06013800
	bl sub_80D6390
	ldr r0, _08051E58 @ =0x08856BCC
	ldr r1, _08051E5C @ =0x06013940
	bl sub_80D6390
	ldr r0, _08051E60 @ =0x08856BF0
	ldr r1, _08051E64 @ =0x06013D40
	bl sub_80D6390
	ldr r6, _08051E3C @ =0x0203E110
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, _08051E68 @ =0x08856DDC
	adds r0, r0, r5
	ldr r4, _08051E6C @ =0x02022B48
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	bl sub_8001EE4
	ldr r6, _08051E70 @ =0x0203E1B4
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r7, _08051E74 @ =0x02017700
	adds r1, r7, #0
	bl sub_8051BC4
	ldr r5, _08051E78 @ =0x0203E1B8
	movs r2, #0
	ldrsh r0, [r5, r2]
	adds r1, r7, #6
	bl sub_8051BC4
	ldr r4, _08051E7C @ =0x0203E1BC
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r1, r7, #0
	adds r1, #0xc
	bl sub_8051BC4
	movs r2, #2
	ldrsh r0, [r6, r2]
	adds r1, r7, #0
	adds r1, #0x12
	bl sub_8051BC4
	movs r1, #2
	ldrsh r0, [r5, r1]
	adds r1, r7, #0
	adds r1, #0x18
	bl sub_8051BC4
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r1, r7, #0
	adds r1, #0x1e
	bl sub_8051BC4
	movs r0, #0
	str r0, [sp]
	ldr r1, _08051E80 @ =0x020169C8
	ldr r2, _08051E84 @ =0x01000100
	mov r0, sp
	bl sub_80D636C
	movs r6, #0
	mov sb, r7
_08051D96:
	movs r5, #0
	lsls r3, r6, #1
	adds r0, r6, #1
	mov r8, r0
	lsls r4, r6, #7
_08051DA0:
	adds r0, r3, r6
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, _08051E88 @ =0x08856C3C
	adds r0, r0, r1
	ldr r7, _08051E80 @ =0x020169C8
	adds r1, r4, r7
	movs r2, #0x10
	str r3, [sp, #4]
	bl sub_80D6370
	adds r4, #0x20
	adds r5, #1
	ldr r3, [sp, #4]
	cmp r5, #2
	bls _08051DA0
	mov r6, r8
	cmp r6, #5
	bls _08051D96
	ldr r1, _08051E8C @ =0x06013A00
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r7, #0
	adds r2, r4, #0
	bl RegisterDataMove
	adds r0, r7, r4
	ldr r1, _08051E90 @ =0x06013E00
	adds r2, r4, #0
	bl RegisterDataMove
	bl sub_80034C4
	movs r0, #0
	movs r1, #0x1d
	bl sub_8003520
	movs r0, #0
	movs r1, #0x1e
	bl sub_8003520
	ldr r0, _08051E94 @ =0x0203E184
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	movs r1, #0xee
	lsls r1, r1, #1
	bl sub_8003678
	ldr r0, _08051E98 @ =0x0203E188
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	movs r1, #0xef
	lsls r1, r1, #1
	bl sub_8003678
	ldr r0, _08051E9C @ =0x085C7290
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051E3C: .4byte 0x0203E110
_08051E40: .4byte 0x0885705C
_08051E44: .4byte 0x02022C28
_08051E48: .4byte 0x0203E1B0
_08051E4C: .4byte 0x0000FFFF
_08051E50: .4byte 0x08856B30
_08051E54: .4byte 0x06013800
_08051E58: .4byte 0x08856BCC
_08051E5C: .4byte 0x06013940
_08051E60: .4byte 0x08856BF0
_08051E64: .4byte 0x06013D40
_08051E68: .4byte 0x08856DDC
_08051E6C: .4byte 0x02022B48
_08051E70: .4byte 0x0203E1B4
_08051E74: .4byte 0x02017700
_08051E78: .4byte 0x0203E1B8
_08051E7C: .4byte 0x0203E1BC
_08051E80: .4byte 0x020169C8
_08051E84: .4byte 0x01000100
_08051E88: .4byte 0x08856C3C
_08051E8C: .4byte 0x06013A00
_08051E90: .4byte 0x06013E00
_08051E94: .4byte 0x0203E184
_08051E98: .4byte 0x0203E188
_08051E9C: .4byte 0x085C7290

