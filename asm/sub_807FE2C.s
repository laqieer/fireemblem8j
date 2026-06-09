	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8081A00, 0x08081A00 + 1
	.section .text.sub_807FE2C, "ax", %progbits
@ sub_807FE2C @ JP 0x0807FE2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807FE2C
	.thumb_func
sub_807FE2C:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807FE68 @ =0x08A1E8AC
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807FE6C @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _0807FE70 @ =0x08A1EB0C
	movs r1, #0x80
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8081A00
	adds r5, #0x40
	movs r0, #0
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE68: .4byte 0x08A1E8AC
_0807FE6C: .4byte 0x06002800
_0807FE70: .4byte 0x08A1EB0C

