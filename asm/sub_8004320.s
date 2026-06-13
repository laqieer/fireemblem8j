	.syntax unified
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.InitTalkTextFont, "ax", %progbits
@ InitTalkTextFont @ JP 0x08004320 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global InitTalkTextFont
	.thumb_func
InitTalkTextFont:
	push {r4, lr}
	ldr r0, _08004350 @ =0x085C7440
	ldr r4, _08004354 @ =0x02028E70
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	ldr r1, _08004358 @ =0x020228A8
	ldr r2, [r4]
	ldrh r0, [r2, #0x14]
	lsls r0, r0, #5
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0800435C @ =sub_8004150
	str r0, [r2, #8]
	movs r0, #1
	bl SetTextFontGlyphs
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004350: .4byte 0x085C7440
_08004354: .4byte 0x02028E70
_08004358: .4byte 0x020228A8
_0800435C: .4byte 0x08004151  @ sub_8004150

