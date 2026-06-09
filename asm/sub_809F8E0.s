	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80045BC, 0x080045BC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8099FA0, 0x08099FA0 + 1
	.section .text.sub_809F8E0, "ax", %progbits
@ sub_809F8E0 @ JP 0x0809F8E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809F8E0
	.thumb_func
sub_809F8E0:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_8099FA0
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r6, r0, #0
	ldr r4, _0809F958 @ =0x02013640
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, #0x90
	adds r0, r4, #0
	movs r1, #0
	bl sub_80045BC
	adds r7, r4, #0
	movs r4, #0
	cmp r5, #0x64
	beq _0809F91A
	cmp r6, #0
	bne _0809F91C
_0809F91A:
	movs r4, #1
_0809F91C:
	ldr r0, _0809F95C @ =0x00000529
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl sub_80043B8
	ldr r5, _0809F960 @ =0x020136D0
	movs r4, #0
	cmp r6, #5
	bne _0809F938
	movs r4, #1
_0809F938:
	ldr r0, _0809F964 @ =0x0000052A
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	adds r2, r4, #0
	bl sub_80043B8
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F958: .4byte 0x02013640
_0809F95C: .4byte 0x00000529
_0809F960: .4byte 0x020136D0
_0809F964: .4byte 0x0000052A

