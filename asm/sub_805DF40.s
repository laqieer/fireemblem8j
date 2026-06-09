	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805DF40, "ax", %progbits
@ sub_805DF40 @ JP 0x0805DF40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805DF40
	.thumb_func
sub_805DF40:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805DF6C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DF70 @ =0x085FF538
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805DF74 @ =0x080E1A4A
	str r1, [r0, #0x48]
	ldr r1, _0805DF78 @ =0x0860A374
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DF6C: .4byte 0x0201774C
_0805DF70: .4byte 0x085FF538
_0805DF74: .4byte 0x080E1A4A
_0805DF78: .4byte 0x0860A374

