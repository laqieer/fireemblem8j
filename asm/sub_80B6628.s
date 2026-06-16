	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set DrawGameOptionIcon, 0x080B6320 + 1
	.set InitText, 0x08003C8C + 1
	.set ResetText, 0x08003BC4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set StartMenuScrollBarExt, 0x08099A2C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80156D8, 0x080156D8 + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.set sub_80B63A4, 0x080B63A4 + 1
	.set sub_80B6404, 0x080B6404 + 1
	.set sub_80B6470, 0x080B6470 + 1
	.section .text.sub_80B6628, "ax", %progbits
@ Config_Init @ JP 0x080B6628 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Config_Init
	.thumb_func
Config_Init:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov sb, r0
	ldr r1, _080B6874 @ =0x081F5880
	add r0, sp, #4
	movs r2, #0x18
	bl memcpy
	movs r0, #0
	mov sl, r0
	add r0, sp, #4
	bl sub_8001ACC
	ldr r2, _080B6878 @ =0x08AAF6D8
	ldr r1, [r2]
	mov r0, sl
	strh r0, [r1, #0x32]
	movs r0, #0xd
	strh r0, [r1, #0x34]
	mov r2, sl
	strh r2, [r1, #0x2a]
	strh r2, [r1, #0x2c]
	strh r2, [r1, #0x2e]
	mov r0, sb
	strh r2, [r0, #0x30]
	adds r0, #0x36
	movs r2, #0
	strb r2, [r0]
	adds r1, #0x37
	ldrb r2, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _080B6878 @ =0x08AAF6D8
	ldr r1, [r0]
	adds r1, #0x37
	ldrb r2, [r1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r1]
	bl ResetText
	bl sub_80156D8
	bl sub_804F8F4
	ldr r7, _080B687C @ =0x03003020
	ldrb r0, [r7, #1]
	movs r1, #1
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r6, #4
	orrs r0, r6
	movs r5, #8
	orrs r0, r5
	movs r4, #0x10
	orrs r0, r4
	strb r0, [r7, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _080B6878 @ =0x08AAF6D8
	ldr r0, [r2]
	ldrh r2, [r0, #0x2e]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r0, [r7, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r1, #0
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	adds r1, #4
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	movs r2, #2
	orrs r0, r2
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	strb r0, [r1]
	adds r1, #2
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	strb r0, [r1]
	movs r0, #1
	movs r1, #0xe
	movs r2, #4
	movs r3, #0
	bl SetBlendConfig
	mov r0, sl
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	mov r1, sl
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldr r0, _080B6880 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B6884 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r5, _080B6888 @ =0x02023CA8
	adds r0, r5, #0
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B688C @ =0x020244A8
	movs r1, #0
	bl sub_80011D0
	ldr r4, _080B6890 @ =0x08A79B50
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	bl sub_8000D68
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080B6894 @ =0x08A793F4
	ldr r1, _080B6898 @ =0x06011800
	bl sub_8013008
	ldr r0, _080B689C @ =0x08A79604
	ldr r1, _080B68A0 @ =0x06004000
	bl sub_8013008
	ldr r0, _080B68A4 @ =0x08A79A6C
	ldr r4, _080B68A8 @ =0x02020208
	adds r1, r4, #0
	bl sub_8013008
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r5, #0
	adds r1, r4, #0
	bl j_TmApplyTsa
	bl ResetTextFont
	ldr r2, _080B6878 @ =0x08AAF6D8
	ldr r0, [r2]
	adds r0, #0xa8
	movs r1, #0x16
	bl InitText
	bl sub_80B63A4
	movs r3, #0xe4
	lsls r3, r3, #7
	movs r0, #1
	str r0, [sp]
	mov r0, sb
	movs r1, #0xe0
	movs r2, #0x2f
	bl StartMenuScrollBarExt
	ldr r1, _080B6878 @ =0x08AAF6D8
	ldr r0, [r1]
	adds r0, #0x68
	movs r1, #9
	bl InitText
	ldr r2, _080B6878 @ =0x08AAF6D8
	ldr r0, [r2]
	adds r0, #0xa0
	movs r1, #0xe
	bl InitText
	ldr r7, _080B6878 @ =0x08AAF6D8
	movs r6, #0x70
	movs r5, #0x38
	movs r4, #5
_080B6804:
	mov r0, sl
	movs r1, #5
	bl DrawGameOptionIcon
	ldr r0, [r7]
	adds r0, r0, r5
	movs r1, #9
	bl InitText
	ldr r0, [r7]
	adds r0, r0, r6
	movs r1, #0xe
	bl InitText
	mov r0, sl
	mov r1, sl
	adds r2, r4, #0
	bl sub_80B6404
	mov r0, sl
	mov r1, sl
	adds r2, r4, #0
	bl sub_80B6470
	adds r6, #8
	adds r5, #8
	adds r4, #2
	movs r0, #1
	add sl, r0
	mov r1, sl
	cmp r1, #5
	ble _080B6804
	movs r0, #0
	str r0, [sp]
	mov r0, sb
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8088FA4
	ldr r0, _080B68AC @ =0x08AAFA0C
	mov r1, sb
	bl sub_8002BCC
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6874: .4byte 0x081F5880
_080B6878: .4byte 0x08AAF6D8
_080B687C: .4byte 0x03003020
_080B6880: .4byte 0x02022CA8
_080B6884: .4byte 0x020234A8
_080B6888: .4byte 0x02023CA8
_080B688C: .4byte 0x020244A8
_080B6890: .4byte 0x08A79B50
_080B6894: .4byte 0x08A793F4
_080B6898: .4byte 0x06011800
_080B689C: .4byte 0x08A79604
_080B68A0: .4byte 0x06004000
_080B68A4: .4byte 0x08A79A6C
_080B68A8: .4byte 0x02020208
_080B68AC: .4byte 0x08AAFA0C

