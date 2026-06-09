	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set ResetText, 0x08003BC4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTalkPrintDelay, 0x080069F4 + 1
	.set sub_8006710, 0x08006710 + 1
	.set sub_80D1780, 0x080D1780 + 1
	.section .text.sub_80D1C68, "ax", %progbits
@ sub_80D1C68 @ JP 0x080D1C68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D1C68
	.thumb_func
sub_80D1C68:
	push {r4, lr}
	adds r4, r0, #0
	bl ResetTextFont
	bl ResetText
	movs r0, #0xf
	bl BG_EnableSyncByMask
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #2
	movs r2, #0
	bl sub_8006710
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, #0x38
	adds r4, r4, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_80D1780
	movs r0, #1
	rsbs r0, r0, #0
	bl SetTalkPrintDelay
	ldr r3, _080D1D0C @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r3, _080D1D10 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, _080D1D14 @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	adds r3, #2
	ldrh r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	adds r3, #2
	ldrh r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	ldr r2, _080D1D18 @ =0x0400000E
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #1
	strh r1, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1D0C: .4byte 0x03003020
_080D1D10: .4byte 0x04000008
_080D1D14: .4byte 0x0000FFFC
_080D1D18: .4byte 0x0400000E

