	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.section .text.sub_80833B8, "ax", %progbits
@ sub_80833B8 @ JP 0x080833B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80833B8
	.thumb_func
sub_80833B8:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_8080CB8
	ldr r2, _08083430 @ =0x03003020
	ldrb r3, [r2, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _08083434 @ =0x08A577D4
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08083438 @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _0808343C @ =0x08A58474
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
_08083430: .4byte 0x03003020
_08083434: .4byte 0x08A577D4
_08083438: .4byte 0x06002800
_0808343C: .4byte 0x08A58474

