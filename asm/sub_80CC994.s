	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CC590, 0x080CC590 + 1
	.section .text.sub_80CC994, "ax", %progbits
@ sub_80CC994 @ JP 0x080CC994 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CC994
	.thumb_func
sub_80CC994:
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
	ldr r1, _080CC9F0 @ =0x02022188
	strh r0, [r1, #6]
	movs r0, #0xe8
	movs r1, #0x88
	bl sub_80CC590
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xe
	bls _080CC9DC
	ldr r3, _080CC9F4 @ =0x08B3F1CE
	ldr r0, _080CC9F8 @ =0x00002046
	str r0, [sp]
	movs r0, #1
	movs r1, #0xaa
	movs r2, #0x78
	bl PutSpriteExt
	ldr r3, _080CC9FC @ =0x08B3F1DC
	ldr r0, _080CCA00 @ =0x00002066
	str r0, [sp]
	movs r0, #1
	movs r1, #0x98
	movs r2, #0x88
	bl PutSpriteExt
_080CC9DC:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080CCA04
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CCA08
	.align 2, 0
_080CC9F0: .4byte 0x02022188
_080CC9F4: .4byte 0x08B3F1CE
_080CC9F8: .4byte 0x00002046
_080CC9FC: .4byte 0x08B3F1DC
_080CCA00: .4byte 0x00002066
_080CCA04:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CCA08:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

