	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.section .text.sub_8083224, "ax", %progbits
@ sub_8083224 @ JP 0x08083224 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083224
	.thumb_func
sub_8083224:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_8080CB8
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _08083278 @ =0x08A577D4
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0808327C @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _08083280 @ =0x08A58474
	movs r1, #0x80
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x42
	strh r1, [r5]
	bl sub_8001EE4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083278: .4byte 0x08A577D4
_0808327C: .4byte 0x06002800
_08083280: .4byte 0x08A58474

