	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CA1F8, "ax", %progbits
@ DrawTitleSprites_Loop @ JP 0x080CA1F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawTitleSprites_Loop
	.thumb_func
DrawTitleSprites_Loop:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _080CA2BC @ =0x08B3ECE4
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x27
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r3, _080CA2C0 @ =0x085B8CE4
	ldr r0, _080CA2C4 @ =0x0000201E
	str r0, [sp]
	movs r0, #0
	movs r1, #0xd8
	movs r2, #0x27
	bl PutSpriteExt
	ldr r2, _080CA2C8 @ =0x0000042C
	movs r0, #0x83
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #2
	movs r1, #0
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r3, _080CA2CC @ =0x08B3ED46
	ldr r0, _080CA2D0 @ =0x000011B0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x3c
	movs r2, #0x1a
	bl PutSpriteExt
	ldr r3, _080CA2D4 @ =0x08B3ED80
	ldr r0, _080CA2D8 @ =0x000031A0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x38
	movs r2, #0x57
	bl PutSpriteExt
	ldr r3, _080CA2DC @ =0x08B3EDBA
	movs r0, #0xf8
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
	movs r1, #0x50
	movs r2, #0x7c
	bl PutSpriteExt
	ldr r3, _080CA2E0 @ =0x08B3ED8E
	movs r0, #0x8c
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x94
	bl PutSpriteExt
	adds r0, r5, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #3
	bl sub_80D637C
	cmp r0, #0
	bne _080CA298
	adds r2, r5, #0
	adds r2, #0x52
	ldrh r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r2]
_080CA298:
	adds r1, r5, #0
	adds r1, #0x52
	ldrh r2, [r1]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080CA2E8
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #1
	ldr r1, _080CA2E4 @ =0x08B4680C
	adds r0, r0, r1
	movs r1, #0x84
	lsls r1, r1, #2
	movs r2, #2
	bl sub_8000D68
	b _080CA302
	.align 2, 0
_080CA2BC: .4byte 0x08B3ECE4
_080CA2C0: .4byte 0x085B8CE4
_080CA2C4: .4byte 0x0000201E
_080CA2C8: .4byte 0x0000042C
_080CA2CC: .4byte 0x08B3ED46
_080CA2D0: .4byte 0x000011B0
_080CA2D4: .4byte 0x08B3ED80
_080CA2D8: .4byte 0x000031A0
_080CA2DC: .4byte 0x08B3EDBA
_080CA2E0: .4byte 0x08B3ED8E
_080CA2E4: .4byte 0x08B4680C
_080CA2E8:
	ldrh r1, [r1]
	movs r0, #0x1f
	subs r0, r0, r1
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _080CA314 @ =0x08B4680C
	adds r0, r0, r1
	movs r1, #0x84
	lsls r1, r1, #2
	movs r2, #2
	bl sub_8000D68
_080CA302:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA314: .4byte 0x08B4680C

