	.syntax unified
	.set InitSpriteText, 0x080044E0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_80044A4, 0x080044A4 + 1
	.set sub_8004564, 0x08004564 + 1
	.section .text.sub_80067B0, "ax", %progbits
@ sub_80067B0 @ JP 0x080067B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80067B0
	.thumb_func
sub_80067B0:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r5, _08006840 @ =0x030000E8
	ldr r1, _08006844 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _08006848 @ =0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl sub_80044A4
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	ldr r0, _0800684C @ =0x085C7440
	adds r4, #0x10
	lsls r1, r4, #5
	movs r2, #0x20
	bl sub_8000D68
	ldr r2, _08006850 @ =0x020228A8
	lsls r4, r4, #4
	adds r0, r4, #4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08006854 @ =0x00007247
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _08006858 @ =0x000031AE
	strh r1, [r0]
	adds r4, #0xf
	lsls r4, r4, #1
	adds r4, r4, r2
	ldr r0, _0800685C @ =0x00007FFF
	strh r0, [r4]
	ldr r0, _08006860 @ =0x085B90D4
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	movs r5, #0
	cmp r5, r6
	bge _08006838
_08006810:
	lsls r4, r5, #3
	ldr r0, _08006864 @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	bl sub_8004564
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	adds r0, r4, #0
	movs r1, #4
	bl sub_8003D84
	adds r5, #1
	cmp r5, r6
	blt _08006810
_08006838:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006840: .4byte 0x030000E8
_08006844: .4byte 0x000003FF
_08006848: .4byte 0x06010000
_0800684C: .4byte 0x085C7440
_08006850: .4byte 0x020228A8
_08006854: .4byte 0x00007247
_08006858: .4byte 0x000031AE
_0800685C: .4byte 0x00007FFF
_08006860: .4byte 0x085B90D4
_08006864: .4byte 0x030000C8

