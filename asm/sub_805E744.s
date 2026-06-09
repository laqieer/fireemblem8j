	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805E744, "ax", %progbits
@ sub_805E744 @ JP 0x0805E744 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E744
	.thumb_func
sub_805E744:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E770 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E774 @ =0x085FF688
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805E778 @ =0x080E1C48
	str r1, [r0, #0x48]
	ldr r1, _0805E77C @ =0x08635410
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E770: .4byte 0x0201774C
_0805E774: .4byte 0x085FF688
_0805E778: .4byte 0x080E1C48
_0805E77C: .4byte 0x08635410

