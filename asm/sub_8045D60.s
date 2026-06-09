	.syntax unified
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetupFaceGfxData, 0x0800544C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8042FC8, 0x08042FC8 + 1
	.set sub_8043084, 0x08043084 + 1
	.set sub_80430E8, 0x080430E8 + 1
	.set sub_8045C8C, 0x08045C8C + 1
	.set sub_804D08C, 0x0804D08C + 1
	.set sub_804D0DC, 0x0804D0DC + 1
	.set sub_804D23C, 0x0804D23C + 1
	.set sub_804D2A8, 0x0804D2A8 + 1
	.set sub_804E3F8, 0x0804E3F8 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.set sub_80AB10C, 0x080AB10C + 1
	.section .text.sub_8045D60, "ax", %progbits
@ sub_8045D60 @ JP 0x08045D60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045D60
	.thumb_func
sub_8045D60:
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	bl sub_8042FC8
	bl sub_804D0DC
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8088FA4
	ldr r0, _08045E6C @ =0x085D6004
	ldr r1, _08045E70 @ =0x06014800
	bl sub_8013008
	ldr r0, _08045E74 @ =0x085D7CD8
	ldr r1, _08045E78 @ =0x06016000
	bl sub_8013008
	ldr r0, _08045E7C @ =0x085D68B4
	ldr r1, _08045E80 @ =0x06016800
	bl sub_8013008
	movs r4, #0x98
	lsls r4, r4, #2
	movs r5, #3
_08045D9C:
	ldr r0, _08045E84 @ =0x085D8048
	adds r1, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge _08045D9C
	ldr r4, _08045E88 @ =0x0203DA20
	ldrb r0, [r4, #3]
	add r1, sp, #4
	bl sub_80AB10C
	ldr r0, _08045E8C @ =0x0203DB60
	bl SetTextFont
	bl sub_80042E0
	bl ResetTextFont
	bl sub_80430E8
	movs r5, #0
	adds r4, #0x9c
	movs r2, #0xff
_08045DD0:
	adds r1, r5, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r5, #1
	cmp r5, #3
	ble _08045DD0
	bl sub_8045C8C
	movs r5, #0
	ldr r2, _08045E90 @ =0x03004E26
_08045DE6:
	adds r0, r5, r2
	mov r1, sp
	adds r1, r1, r5
	adds r1, #4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r5, #1
	cmp r5, #0xe
	ble _08045DE6
	movs r0, #0
	str r0, [r6, #0x34]
	str r0, [r6, #0x30]
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r6, #0
	bl sub_804D08C
	movs r0, #0x50
	movs r1, #0x20
	adds r2, r6, #0
	bl sub_804E3F8
	str r0, [r6, #0x2c]
	ldr r0, _08045E94 @ =0x085D376C
	bl SetupFaceGfxData
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0x65
	movs r2, #0xd0
	movs r3, #0x50
	bl sub_8005544
	ldr r0, [r6, #0x2c]
	ldr r2, _08045E98 @ =0x080DED3A
	ldr r1, _08045E88 @ =0x0203DA20
	ldrb r1, [r1]
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0
	bl sub_804D23C
	bl sub_804D2A8
	ldr r0, [r6, #0x30]
	ldr r1, _08045E9C @ =0x000006D3
	adds r0, r0, r1
	movs r1, #1
	bl sub_8043084
	ldr r2, _08045EA0 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045E6C: .4byte 0x085D6004
_08045E70: .4byte 0x06014800
_08045E74: .4byte 0x085D7CD8
_08045E78: .4byte 0x06016000
_08045E7C: .4byte 0x085D68B4
_08045E80: .4byte 0x06016800
_08045E84: .4byte 0x085D8048
_08045E88: .4byte 0x0203DA20
_08045E8C: .4byte 0x0203DB60
_08045E90: .4byte 0x03004E26
_08045E94: .4byte 0x085D376C
_08045E98: .4byte 0x080DED3A
_08045E9C: .4byte 0x000006D3
_08045EA0: .4byte 0x03003020

