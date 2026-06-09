	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set InitMenuScrollBarImg, 0x080999E4 + 1
	.set InitText, 0x08003C8C + 1
	.set PutMenuScrollBarAt, 0x08099990 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set StartMenuScrollBar, 0x0809997C + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_80B1460, 0x080B1460 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1F1C, 0x080B1F1C + 1
	.set sub_80B1F40, 0x080B1F40 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.set sub_80B528C, 0x080B528C + 1
	.set sub_80B5378, 0x080B5378 + 1
	.set sub_80B54AC, 0x080B54AC + 1
	.set sub_80B566C, 0x080B566C + 1
	.set sub_80B56D8, 0x080B56D8 + 1
	.section .text.sub_80B56F8, "ax", %progbits
@ sub_80B56F8 @ JP 0x080B56F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B56F8
	.thumb_func
sub_80B56F8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl sub_8001ACC
	ldr r0, _080B5920 @ =0x08BB059C
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x40
	bl sub_8000D68
	ldr r0, _080B5924 @ =0x08AA7310
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080B5928 @ =0x08BABE04
	ldr r1, _080B592C @ =0x06008000
	bl sub_8013008
	ldr r0, _080B5930 @ =0x020244A8
	ldr r1, _080B5934 @ =0x08AA7330
	movs r2, #0xc0
	lsls r2, r2, #8
	bl j_TmApplyTsa
	movs r0, #8
	bl BG_EnableSyncByMask
	bl sub_804F8F4
	bl ResetText
	bl sub_80034C4
	movs r0, #4
	bl sub_8003508
	bl sub_801569C
	bl sub_80B528C
	bl sub_80B56D8
	ldr r0, _080B5938 @ =0x03003020
	mov ip, r0
	ldrb r1, [r0, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r7, ip
	adds r7, #0x35
	ldrb r0, [r7]
	movs r4, #1
	orrs r0, r4
	movs r5, #2
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r7]
	adds r7, #1
	ldrb r0, [r7]
	orrs r0, r4
	orrs r0, r5
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r3
	orrs r0, r2
	strb r0, [r7]
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	mov r0, ip
	ldrb r2, [r0, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	mov r2, ip
	strb r0, [r2, #0xc]
	ldrb r2, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	mov r2, ip
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	bl sub_80B5378
	movs r5, #0
	ldr r0, _080B593C @ =0x08A9E504
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r5, r0
	bge _080B5828
	ldr r7, _080B5940 @ =0x08A9E508
_080B57FA:
	lsls r0, r5, #4
	ldr r4, [r7]
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0xa
	bl InitText
	adds r0, r5, #0
	bl sub_80B54AC
	adds r5, #1
	cmp r5, #5
	bgt _080B5828
	ldr r0, _080B593C @ =0x08A9E504
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r5, r0
	blt _080B57FA
_080B5828:
	adds r0, r6, #0
	adds r0, #0x29
	str r0, [sp]
	movs r1, #0x2e
	adds r1, r1, r6
	mov sl, r1
	movs r2, #0x2a
	adds r2, r2, r6
	mov r8, r2
	movs r0, #0x2b
	adds r0, r0, r6
	mov sb, r0
	ldr r7, _080B5940 @ =0x08A9E508
	movs r4, #0x60
	movs r5, #1
_080B5846:
	ldr r0, [r7]
	adds r0, r0, r4
	movs r1, #6
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080B5846
	movs r5, #2
	ldr r0, _080B5940 @ =0x08A9E508
	ldr r0, [r0]
	adds r0, #0x70
	movs r1, #0xf
	bl InitText
	ldr r0, _080B5944 @ =sub_80B5250
	adds r1, r6, #0
	bl sub_80B1D98
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r0, _080B5948 @ =sub_80B5314
	bl SetPrimaryHBlankHandler
	movs r0, #0
	ldr r1, [sp]
	strb r0, [r1]
	movs r1, #0
	strh r0, [r6, #0x2c]
	mov r2, sl
	strb r1, [r2]
	mov r2, r8
	strb r1, [r2]
	mov r1, sb
	strb r5, [r1]
	str r0, [r6, #0x34]
	ldr r1, _080B594C @ =0x0000FFD8
	ldrh r2, [r6, #0x2c]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	adds r0, r6, #0
	bl sub_80B1F1C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80B1F40
	ldr r2, [sp]
	ldrb r1, [r2]
	lsls r1, r1, #4
	movs r2, #0x2c
	ldrsh r0, [r6, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl sub_80B1FBC
	adds r0, r6, #0
	bl sub_80048B4
	adds r0, r6, #0
	bl StartMenuScrollBar
	movs r0, #0xc8
	movs r1, #0x40
	bl PutMenuScrollBarAt
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl InitMenuScrollBarImg
	ldrh r1, [r6, #0x2c]
	ldr r0, _080B593C @ =0x08A9E504
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #8
	movs r3, #5
	bl UpdateMenuScrollBarConfig
	adds r0, r6, #0
	bl sub_80B1460
	adds r0, r6, #0
	bl sub_80B566C
	ldr r0, _080B5950 @ =0x06013800
	movs r1, #5
	bl sub_808BB14
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5920: .4byte 0x08BB059C
_080B5924: .4byte 0x08AA7310
_080B5928: .4byte 0x08BABE04
_080B592C: .4byte 0x06008000
_080B5930: .4byte 0x020244A8
_080B5934: .4byte 0x08AA7330
_080B5938: .4byte 0x03003020
_080B593C: .4byte 0x08A9E504
_080B5940: .4byte 0x08A9E508
_080B5944: .4byte 0x080B5251  @ sub_80B5250
_080B5948: .4byte 0x080B5315  @ sub_80B5314
_080B594C: .4byte 0x0000FFD8
_080B5950: .4byte 0x06013800

