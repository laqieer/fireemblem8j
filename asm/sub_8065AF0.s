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
	.section .text.sub_8065AF0, "ax", %progbits
@ sub_8065AF0 @ JP 0x08065AF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065AF0
	.thumb_func
sub_8065AF0:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _08065B34 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065B38 @ =0x08601670
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xc
	strh r0, [r5, #0x2e]
	ldr r0, _08065B3C @ =0x087529A4
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	bl sub_8056130
	ldr r0, _08065B40 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08065B4C
	ldr r0, _08065B44 @ =0x08753C8C
	ldr r1, _08065B48 @ =0x02019790
	bl sub_80D6394
	b _08065B54
	.align 2, 0
_08065B34: .4byte 0x0201774C
_08065B38: .4byte 0x08601670
_08065B3C: .4byte 0x087529A4
_08065B40: .4byte 0x0203E11C
_08065B44: .4byte 0x08753C8C
_08065B48: .4byte 0x02019790
_08065B4C:
	ldr r0, _08065B74 @ =0x087540E8
	ldr r1, _08065B78 @ =0x02019790
	bl sub_80D6394
_08065B54:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08065B80
	ldr r0, _08065B78 @ =0x02019790
	ldr r1, _08065B7C @ =0x020234A8
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_80733E8
	b _08065B94
	.align 2, 0
_08065B74: .4byte 0x087540E8
_08065B78: .4byte 0x02019790
_08065B7C: .4byte 0x020234A8
_08065B80:
	ldr r0, _08065BC8 @ =0x02019790
	ldr r1, _08065BCC @ =0x020234A8
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08065B94:
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_8056158
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _08065BD0 @ =0x03003020
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
_08065BC8: .4byte 0x02019790
_08065BCC: .4byte 0x020234A8
_08065BD0: .4byte 0x03003020

