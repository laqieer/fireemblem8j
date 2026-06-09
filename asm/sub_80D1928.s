	.syntax unified
	.set DrawUiFrame, 0x0804EF40 + 1
	.set GetClassData, 0x0801911C + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80D1928, "ax", %progbits
@ sub_80D1928 @ JP 0x080D1928 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D1928
	.thumb_func
sub_80D1928:
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	ldr r0, _080D1998 @ =0x02023CA8
	movs r1, #6
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #2
	movs r2, #1
	movs r3, #0xa
	bl DrawUiFrame
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	ldrh r0, [r6, #0x2c]
	bl GetClassData
	ldrh r0, [r0]
	bl sub_8009FA8
	ldr r4, _080D199C @ =0x02022D2E
	movs r5, #8
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	ldrh r0, [r6, #0x2e]
	bl GetClassData
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r4, #0x80
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D1998: .4byte 0x02023CA8
_080D199C: .4byte 0x02022D2E

