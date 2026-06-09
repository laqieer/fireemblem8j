	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.section .text.sub_807F860, "ax", %progbits
@ sub_807F860 @ JP 0x0807F860 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807F860
	.thumb_func
sub_807F860:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_8080CB8
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807F8B4 @ =0x08A23C58
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807F8B8 @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _0807F8BC @ =0x08A25284
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
_0807F8B4: .4byte 0x08A23C58
_0807F8B8: .4byte 0x06002800
_0807F8BC: .4byte 0x08A25284

