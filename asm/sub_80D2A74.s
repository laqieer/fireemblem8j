	.syntax unified
	.set ResetText, 0x08003BC4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.set sub_804FA3C, 0x0804FA3C + 1
	.section .text.sub_80D2A74, "ax", %progbits
@ sub_80D2A74 @ JP 0x080D2A74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2A74
	.thumb_func
sub_80D2A74:
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r0, #0x4c
	movs r5, #0
	strb r5, [r0]
	bl ResetTextFont
	bl ResetText
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r4, _080D2AC0 @ =0x03005370
	ldr r1, _080D2AC4 @ =0x06001400
	adds r0, r4, #0
	movs r2, #0xa0
	movs r3, #5
	bl sub_8003BE8
	adds r0, r4, #0
	bl SetTextFont
	ldr r0, _080D2AC8 @ =0x08BABA34
	ldr r1, _080D2ACC @ =0x08BABAB0
	ldr r1, [r1]
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r2, #2
	movs r3, #0
	bl sub_804FA3C
	str r0, [r6, #0x50]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D2AC0: .4byte 0x03005370
_080D2AC4: .4byte 0x06001400
_080D2AC8: .4byte 0x08BABA34
_080D2ACC: .4byte 0x08BABAB0

