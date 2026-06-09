	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set InitSpriteText, 0x080044E0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_80045BC, 0x080045BC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8097D24, "ax", %progbits
@ sub_8097D24 @ JP 0x08097D24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097D24
	.thumb_func
sub_8097D24:
	push {r4, r5, lr}
	sub sp, #0x20
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08097D80 @ =0x06010000
	adds r2, r2, r0
	mov r0, sp
	adds r1, r2, #0
	adds r2, r4, #0
	bl sub_80044A4
	ldr r0, _08097D84 @ =0x085C7420
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	add r4, sp, #0x18
	adds r0, r4, #0
	bl InitSpriteText
	mov r0, sp
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	movs r1, #0
	bl sub_80045BC
	bl sub_80C1E74
	adds r5, r4, #0
	cmp r0, #2
	beq _08097D8C
	ldr r0, _08097D88 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8a
	ldrh r0, [r0]
	b _08097D90
	.align 2, 0
_08097D80: .4byte 0x06010000
_08097D84: .4byte 0x085C7420
_08097D88: .4byte 0x0202BCEC
_08097D8C:
	movs r0, #0x93
	lsls r0, r0, #1
_08097D90:
	bl sub_8009FA8
	adds r4, r0, #0
	movs r0, #0x60
	adds r1, r4, #0
	bl sub_8003EAC
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_80043B8
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0

