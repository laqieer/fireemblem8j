	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CC590, 0x080CC590 + 1
	.section .text.sub_80CD16C, "ax", %progbits
@ OpAnimEirikaMergeShadow @ JP 0x080CD16C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global OpAnimEirikaMergeShadow
	.thumb_func
OpAnimEirikaMergeShadow:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r3, [r4, #0x2a]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa0
	movs r2, #0x78
	bl sub_8012E84
	ldr r1, _080CD1C8 @ =0x02022188
	strh r0, [r1, #6]
	movs r0, #8
	movs r1, #0x88
	bl sub_80CC590
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xe
	bls _080CD1B4
	ldr r3, _080CD1CC @ =0x08B3F1F0
	ldr r0, _080CD1D0 @ =0x0000208E
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0x78
	bl PutSpriteExt
	ldr r3, _080CD1D4 @ =0x08B3F204
	ldr r0, _080CD1D8 @ =0x000020B2
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0x88
	bl PutSpriteExt
_080CD1B4:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080CD1DC
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CD1E0
	.align 2, 0
_080CD1C8: .4byte 0x02022188
_080CD1CC: .4byte 0x08B3F1F0
_080CD1D0: .4byte 0x0000208E
_080CD1D4: .4byte 0x08B3F204
_080CD1D8: .4byte 0x000020B2
_080CD1DC:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CD1E0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

