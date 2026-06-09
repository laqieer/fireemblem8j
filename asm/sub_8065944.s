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
	.section .text.sub_8065944, "ax", %progbits
@ sub_8065944 @ JP 0x08065944 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065944
	.thumb_func
sub_8065944:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _08065988 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806598C @ =0x08601630
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xc
	strh r0, [r5, #0x2e]
	ldr r0, _08065990 @ =0x0875B570
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	bl sub_8056130
	ldr r0, _08065994 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080659A0
	ldr r0, _08065998 @ =0x0875C65C
	ldr r1, _0806599C @ =0x02019790
	bl sub_80D6394
	b _080659A8
	.align 2, 0
_08065988: .4byte 0x0201774C
_0806598C: .4byte 0x08601630
_08065990: .4byte 0x0875B570
_08065994: .4byte 0x0203E11C
_08065998: .4byte 0x0875C65C
_0806599C: .4byte 0x02019790
_080659A0:
	ldr r0, _080659C8 @ =0x0875CA90
	ldr r1, _080659CC @ =0x02019790
	bl sub_80D6394
_080659A8:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080659D4
	ldr r0, _080659CC @ =0x02019790
	ldr r1, _080659D0 @ =0x020234A8
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_80733E8
	b _080659E8
	.align 2, 0
_080659C8: .4byte 0x0875CA90
_080659CC: .4byte 0x02019790
_080659D0: .4byte 0x020234A8
_080659D4:
	ldr r0, _08065A1C @ =0x02019790
	ldr r1, _08065A20 @ =0x020234A8
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_080659E8:
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_8056158
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _08065A24 @ =0x03003020
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
_08065A1C: .4byte 0x02019790
_08065A20: .4byte 0x020234A8
_08065A24: .4byte 0x03003020

