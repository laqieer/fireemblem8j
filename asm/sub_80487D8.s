	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set InitText, 0x08003C8C + 1
	.set MultiBootInit, 0x0804E754 + 1
	.set PutText, 0x08003DA0 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SetTextFont, 0x08003C68 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set m4aSoundVSyncOff, 0x080D54F8 + 1
	.set memcpy, 0x080D6908 + 1
	.set nullsub_2, 0x0804D148 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80487D8, "ax", %progbits
@ sub_80487D8 @ JP 0x080487D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80487D8
	.thumb_func
sub_80487D8:
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	ldr r1, _08048960 @ =0x080DEEE8
	add r0, sp, #4
	movs r2, #0x18
	bl memcpy
	add r0, sp, #4
	bl sub_8001ACC
	ldr r3, _08048964 @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl nullsub_2
	ldr r4, _08048968 @ =0x085DF388
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0804896C @ =0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _08048970 @ =0x085DF60C
	movs r1, #0x80
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08048974 @ =0x085DF62C
	ldr r1, _08048978 @ =0x06014000
	bl sub_8013008
	ldr r0, _0804897C @ =0x085DFA48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r4, _08048980 @ =0x020234A8
	ldr r1, _08048984 @ =0x085DF4B8
	ldr r5, _08048988 @ =0x00004078
	adds r0, r4, #0
	adds r2, r5, #0
	bl j_TmApplyTsa
	movs r2, #0x88
	lsls r2, r2, #3
	adds r4, r4, r2
	ldr r1, _0804898C @ =0x085DF554
	adds r0, r4, #0
	adds r2, r5, #0
	bl j_TmApplyTsa
	ldr r4, _08048990 @ =0x085DB188
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _08048994 @ =0x085DED24
	ldr r4, _08048998 @ =0x020244A8
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _0804899C @ =0x085DF288
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0xe0
	bl sub_8000D68
	movs r2, #0xe0
	lsls r2, r2, #7
	adds r1, r2, #0
	movs r5, #0xa0
	lsls r5, r5, #2
_080488A4:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _080488A4
	ldr r0, _080489A0 @ =0x085D3EA8
	adds r1, r6, #0
	bl sub_8002BCC
	ldr r0, _080489A4 @ =0x0203DB60
	bl SetTextFont
	bl sub_80042E0
	bl ResetTextFont
	ldr r4, _080489A8 @ =0x0203DD08
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl sub_8003CF8
	movs r0, #0x62
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl sub_80043B8
	ldr r1, _080489AC @ =0x02023136
	adds r0, r4, #0
	bl PutText
	movs r0, #0xb
	bl BG_EnableSyncByMask
	movs r0, #0
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	bl m4aSoundVSyncOff
	ldr r0, _080489B0 @ =0x03004E10
	ldr r1, _080489B4 @ =0x08BB310C
	str r1, [r0]
	ldr r2, _080489B8 @ =0x03004EAC
	ldr r0, _080489BC @ =0x08BB8788
	subs r0, r0, r1
	str r0, [r2]
	ldr r0, _080489C0 @ =0x03004EB0
	str r1, [r0, #0x28]
	adds r1, r0, #0
	adds r1, #0x4b
	strb r5, [r1]
	bl MultiBootInit
	ldr r0, _080489C4 @ =0x085D31E8
	ldr r1, [r0]
	movs r0, #4
	strb r0, [r1, #0xb]
	adds r0, r6, #0
	adds r0, #0x64
	strh r5, [r0]
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048960: .4byte 0x080DEEE8
_08048964: .4byte 0x03003020
_08048968: .4byte 0x085DF388
_0804896C: .4byte 0x06000F00
_08048970: .4byte 0x085DF60C
_08048974: .4byte 0x085DF62C
_08048978: .4byte 0x06014000
_0804897C: .4byte 0x085DFA48
_08048980: .4byte 0x020234A8
_08048984: .4byte 0x085DF4B8
_08048988: .4byte 0x00004078
_0804898C: .4byte 0x085DF554
_08048990: .4byte 0x085DB188
_08048994: .4byte 0x085DED24
_08048998: .4byte 0x020244A8
_0804899C: .4byte 0x085DF288
_080489A0: .4byte 0x085D3EA8
_080489A4: .4byte 0x0203DB60
_080489A8: .4byte 0x0203DD08
_080489AC: .4byte 0x02023136
_080489B0: .4byte 0x03004E10
_080489B4: .4byte 0x08BB310C
_080489B8: .4byte 0x03004EAC
_080489BC: .4byte 0x08BB8788
_080489C0: .4byte 0x03004EB0
_080489C4: .4byte 0x085D31E8

