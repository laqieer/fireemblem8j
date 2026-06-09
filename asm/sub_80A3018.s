	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80A3018, "ax", %progbits
@ sub_80A3018 @ JP 0x080A3018 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3018
	.thumb_func
sub_80A3018:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, _080A3068 @ =0x02013498
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	movs r6, #0
	movs r5, #0x80
	ldr r7, _080A306C @ =0x08A95438
_080A3030:
	adds r0, r4, #0
	bl sub_8003CF8
	ldm r7!, {r0}
	bl sub_8009FA8
	adds r3, r4, #0
	adds r4, #8
	ldr r1, _080A3070 @ =0x02023CB0
	adds r1, r5, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #0
	bl sub_8004374
	adds r5, #0x80
	adds r6, #1
	cmp r6, #4
	ble _080A3030
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3068: .4byte 0x02013498
_080A306C: .4byte 0x08A95438
_080A3070: .4byte 0x02023CB0

