	.syntax unified
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_807DD40, "ax", %progbits
@ sub_807DD40 @ JP 0x0807DD40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807DD40
	.thumb_func
sub_807DD40:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807DD68 @ =0x08A1DEF0
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807DD6C @ =0x000003FF
	ands r0, r4
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r5, #0
	bl sub_8013008
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DD68: .4byte 0x08A1DEF0
_0807DD6C: .4byte 0x000003FF

