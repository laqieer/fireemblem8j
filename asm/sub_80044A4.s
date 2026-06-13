	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8003BC0, 0x08003BC0 + 1
	.section .text.InitSpriteTextFont, "ax", %progbits
@ InitSpriteTextFont @ JP 0x080044A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global InitSpriteTextFont
	.thumb_func
InitSpriteTextFont:
	push {r4, lr}
	adds r4, r0, #0
	str r1, [r4]
	ldr r0, _080044D8 @ =GetSpriteTextDrawDest
	str r0, [r4, #0xc]
	movs r0, #0xf
	ands r2, r0
	adds r2, #0x10
	movs r0, #0
	strh r2, [r4, #0x14]
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x14
	strh r1, [r4, #0x10]
	strh r0, [r4, #0x12]
	bl sub_8003BC0
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl SetTextFont
	ldr r0, _080044DC @ =sub_8004608
	str r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080044D8: .4byte 0x080045E9  @ GetSpriteTextDrawDest
_080044DC: .4byte 0x08004609  @ sub_8004608

