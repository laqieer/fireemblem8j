	.syntax unified
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8091590, 0x08091590 + 1
	.set sub_809162C, 0x0809162C + 1
	.set sub_80922A4, 0x080922A4 + 1
	.section .text.sub_80913C0, "ax", %progbits
@ sub_80913C0 @ JP 0x080913C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80913C0
	.thumb_func
sub_80913C0:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_8091590
	adds r0, r5, #0
	adds r0, #0x54
	movs r4, #0
	strb r4, [r0]
	movs r0, #1
	bl SetTextFontGlyphs
	adds r1, r5, #0
	adds r1, #0x59
	strb r4, [r1]
	adds r2, r5, #0
	adds r2, #0x5a
	strb r4, [r2]
	ldr r0, [r5, #0x2c]
	bl sub_809162C
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	bl sub_80922A4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

