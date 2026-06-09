	.syntax unified
	.set FormatTime, 0x08000D14 + 1
	.set PutSprite, 0x080052F0 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80490C8, "ax", %progbits
@ sub_80490C8 @ JP 0x080490C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80490C8
	.thumb_func
sub_80490C8:
	push {r4, r5, r6, lr}
	sub sp, #0xc
	mov r6, sp
	adds r6, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r6, #0
	adds r3, r5, #0
	bl FormatTime
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, #0x63
	bls _080490F0
	add r0, sp, #4
	movs r1, #0x63
	strh r1, [r0]
	movs r0, #0x3b
	strh r0, [r5]
	strh r0, [r6]
_080490F0:
	ldrh r0, [r5]
	movs r1, #0xa
	bl sub_80D637C
	ldr r4, _080491B0 @ =0x085D3FBC
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd8
	movs r2, #0x90
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r5]
	movs r1, #0xa
	bl sub_80D6374
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x90
	adds r3, r4, #0
	bl PutSprite
	movs r5, #0xa
	str r5, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x90
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r6]
	movs r1, #0xa
	bl sub_80D637C
	ldr r4, _080491B4 @ =0x085D3FB4
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r6]
	movs r1, #0xa
	bl sub_80D6374
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb8
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	str r5, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl sub_80D637C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl sub_80D6374
	cmp r0, #0
	ble _080491A8
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl sub_80D6374
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa0
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
_080491A8:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080491B0: .4byte 0x085D3FBC
_080491B4: .4byte 0x085D3FB4

