	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set ResetText, 0x08003BC4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set StartMenuScrollBarExt, 0x08099A2C + 1
	.set StartMuralBackground, 0x08088E74 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80011F0, 0x080011F0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1F1C, 0x080B1F1C + 1
	.set sub_80B1F40, 0x080B1F40 + 1
	.set sub_80B3984, 0x080B3984 + 1
	.set sub_80B3DF8, 0x080B3DF8 + 1
	.set sub_80B3F58, 0x080B3F58 + 1
	.set sub_80B3F70, 0x080B3F70 + 1
	.set sub_80B3FE8, 0x080B3FE8 + 1
	.set sub_80B40F0, 0x080B40F0 + 1
	.set sub_80B4498, 0x080B4498 + 1
	.set sub_80B4B48, 0x080B4B48 + 1
	.set sub_80B505C, 0x080B505C + 1
	.section .text.sub_80B4144, "ax", %progbits
@ sub_80B4144 @ JP 0x080B4144 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SoundRoomUi_Init
	.thumb_func
SoundRoomUi_Init:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	bl sub_8001ACC
	bl ResetTextFont
	bl ResetText
	bl sub_801569C
	bl sub_804F8F4
	bl sub_80042E0
	ldr r7, _080B43C4 @ =0x03003020
	ldrb r2, [r7, #1]
	movs r0, #1
	orrs r2, r0
	movs r1, #2
	mov sl, r1
	mov r3, sl
	orrs r2, r3
	movs r0, #4
	orrs r2, r0
	movs r1, #8
	orrs r2, r1
	movs r3, #0x10
	orrs r2, r3
	ldrb r3, [r7, #0xc]
	subs r1, #0xc
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r7, #0xc]
	ldrb r3, [r7, #0x10]
	adds r0, r1, #0
	ands r0, r3
	mov r3, sl
	orrs r0, r3
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r2, r0
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r2, r1
	movs r3, #0x7f
	ands r2, r3
	strb r2, [r7, #1]
	movs r0, #0
	bl sub_80011F0
	ldr r0, _080B43C8 @ =0x02022CA8
	mov r8, r0
	movs r1, #0
	bl sub_80011D0
	ldr r6, _080B43CC @ =0x020234A8
	adds r0, r6, #0
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B43D0 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B43D4 @ =0x020244A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #0xf
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	adds r0, #0x35
	movs r1, #0
	mov sb, r1
	mov r2, sb
	strb r2, [r0]
	adds r0, #2
	strb r2, [r0]
	mov r3, sb
	strh r3, [r4, #0x2a]
	adds r0, #4
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #0xf
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r2, r4, #0
	adds r2, #0x32
	movs r0, #0xff
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	strh r3, [r4, #0x2c]
	adds r0, #0x11
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_80B3984
	bl SoundRoom_InitText
	adds r0, r4, #0
	bl sub_80B4498
	adds r0, r4, #0
	bl sub_80B1F1C
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #2
	bl sub_80B1F40
	adds r0, r4, #0
	bl sub_80B3F70
	adds r0, r4, #0
	bl sub_80B3FE8
	movs r5, #0x80
	lsls r5, r5, #5
	movs r0, #3
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd8
	movs r2, #0x48
	adds r3, r5, #0
	bl StartMenuScrollBarExt
	adds r0, r4, #0
	bl sub_80B3F58
	ldr r0, _080B43D8 @ =0x08AAAA98
	ldr r1, _080B43DC @ =0x06004000
	bl sub_8013008
	ldr r0, _080B43E0 @ =0x08A73F9C
	movs r1, #0x80
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080B43E4 @ =0x08A73FBC
	movs r1, #0xa0
	movs r2, #0x20
	bl sub_8000D68
	movs r1, #0xe1
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r1, _080B43E8 @ =0x08AAA658
	adds r2, r5, #0
	bl j_TmApplyTsa
	movs r2, #0xab
	lsls r2, r2, #1
	adds r6, r6, r2
	ldr r1, _080B43EC @ =0x08AAA738
	adds r0, r6, #0
	adds r2, r5, #0
	bl j_TmApplyTsa
	movs r3, #0xd0
	lsls r3, r3, #1
	add r8, r3
	mov r0, r8
	adds r1, r4, #0
	bl sub_80B40F0
	ldr r0, _080B43F0 @ =0x08AADC58
	ldr r1, _080B43F4 @ =0x06016000
	bl sub_8013008
	ldr r0, _080B43F8 @ =0x08AAEAE4
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r1, _080B43FC @ =0x0000FFFC
	movs r0, #2
	movs r2, #0
	bl BG_SetPosition
	ldrb r0, [r7, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r2, #0x7f
	ands r0, r2
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r3, #1
	orrs r0, r3
	mov r2, sl
	orrs r0, r2
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r1]
	subs r1, #7
	movs r0, #4
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x42
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x90
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	mov r3, sl
	orrs r0, r3
	subs r1, #6
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	ldr r0, _080B4400 @ =0x08AAAC4C
	ldr r1, _080B4404 @ =0x06012000
	bl sub_8013008
	ldr r0, _080B4408 @ =0x08AAB440
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl sub_8000D68
	adds r0, r4, #0
	bl sub_80B505C
	movs r0, #1
	movs r1, #0xf
	movs r2, #3
	movs r3, #0
	bl SetBlendConfig
	mov r0, sb
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, sb
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xe
	bl StartMuralBackground
	adds r0, r4, #0
	bl sub_80048B4
	bl sub_80B3DF8
	ldr r0, _080B440C @ =TickCurrentSongTime
	adds r1, r4, #0
	bl sub_80B1D98
	ldr r0, _080B4410 @ =0x08A9E270
	adds r1, r4, #0
	bl sub_8002BCC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B43C4: .4byte 0x03003020
_080B43C8: .4byte 0x02022CA8
_080B43CC: .4byte 0x020234A8
_080B43D0: .4byte 0x02023CA8
_080B43D4: .4byte 0x020244A8
_080B43D8: .4byte 0x08AAAA98
_080B43DC: .4byte 0x06004000
_080B43E0: .4byte 0x08A73F9C
_080B43E4: .4byte 0x08A73FBC
_080B43E8: .4byte 0x08AAA658
_080B43EC: .4byte 0x08AAA738
_080B43F0: .4byte 0x08AADC58
_080B43F4: .4byte 0x06016000
_080B43F8: .4byte 0x08AAEAE4
_080B43FC: .4byte 0x0000FFFC
_080B4400: .4byte 0x08AAAC4C
_080B4404: .4byte 0x06012000
_080B4408: .4byte 0x08AAB440
_080B440C: .4byte 0x080B4131  @ TickCurrentSongTime
_080B4410: .4byte 0x08A9E270

