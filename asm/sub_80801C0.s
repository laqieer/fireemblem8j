	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.section .text.sub_80801C0, "ax", %progbits
@ sub_80801C0 @ JP 0x080801C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80801C0
	.thumb_func
sub_80801C0:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8080CB8
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r4, _08080210 @ =0x08A21158
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08080214 @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _08080218 @ =0x086ADC90
	movs r1, #0x80
	movs r2, #0x20
	bl sub_8000D68
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x4a
	strh r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080210: .4byte 0x08A21158
_08080214: .4byte 0x06002800
_08080218: .4byte 0x086ADC90

