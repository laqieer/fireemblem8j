	.syntax unified
	.set sub_8009FE4, 0x08009FE4 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B27C4, 0x080B27C4 + 1
	.section .text.sub_80A2074, "ax", %progbits
@ sub_80A2074 @ JP 0x080A2074 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2074
	.thumb_func
sub_80A2074:
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080A20B0 @ =WmSell_DrawSupplyDialogueSpriteText
	bl sub_80B1D98
	ldr r0, _080A20B4 @ =0x08A95260
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _080A20B8 @ =0x08A95268
	ldr r1, [r1]
	bl sub_8009FE4
	adds r2, r0, #0
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xd
	movs r3, #1
	bl sub_80B27C4
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A20B0: .4byte 0x080A2041  @ WmSell_DrawSupplyDialogueSpriteText
_080A20B4: .4byte 0x08A95260
_080A20B8: .4byte 0x08A95268

