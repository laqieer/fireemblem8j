	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80733E8, 0x080733E8 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_80668CC, "ax", %progbits
@ sub_80668CC @ JP 0x080668CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80668CC
	.thumb_func
sub_80668CC:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _08066910 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08066914 @ =0x086018A8
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #5
	strh r0, [r5, #0x2e]
	ldr r0, _08066918 @ =0x087529A4
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	bl sub_8056130
	ldr r0, _0806691C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08066928
	ldr r0, _08066920 @ =0x08753C8C
	ldr r1, _08066924 @ =0x02019790
	bl sub_80D6394
	b _08066930
	.align 2, 0
_08066910: .4byte 0x0201774C
_08066914: .4byte 0x086018A8
_08066918: .4byte 0x087529A4
_0806691C: .4byte 0x0203E11C
_08066920: .4byte 0x08753C8C
_08066924: .4byte 0x02019790
_08066928:
	ldr r0, _08066950 @ =0x087540E8
	ldr r1, _08066954 @ =0x02019790
	bl sub_80D6394
_08066930:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806695C
	ldr r0, _08066954 @ =0x02019790
	ldr r1, _08066958 @ =0x020234A8
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_80733E8
	b _08066970
	.align 2, 0
_08066950: .4byte 0x087540E8
_08066954: .4byte 0x02019790
_08066958: .4byte 0x020234A8
_0806695C:
	ldr r0, _080669A4 @ =0x02019790
	ldr r1, _080669A8 @ =0x020234A8
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08066970:
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_8056158
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _080669AC @ =0x03003020
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080669A4: .4byte 0x02019790
_080669A8: .4byte 0x020234A8
_080669AC: .4byte 0x03003020

