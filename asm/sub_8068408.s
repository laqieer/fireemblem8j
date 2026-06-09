	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8068408, "ax", %progbits
@ sub_8068408 @ JP 0x08068408 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8068408
	.thumb_func
sub_8068408:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetAnimPosition
	ldr r0, _0806844C @ =0x086BF6E8
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08068450 @ =0x086BF2B8
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	ldr r1, _08068454 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08068458 @ =0x08601E4C
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetAnimAnotherSide
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806844C: .4byte 0x086BF6E8
_08068450: .4byte 0x086BF2B8
_08068454: .4byte 0x0201774C
_08068458: .4byte 0x08601E4C

