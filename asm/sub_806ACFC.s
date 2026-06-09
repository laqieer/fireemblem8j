	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056120, 0x08056120 + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.section .text.sub_806ACFC, "ax", %progbits
@ sub_806ACFC @ JP 0x0806ACFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806ACFC
	.thumb_func
sub_806ACFC:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0806AD40 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806AD44 @ =0x08602930
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x70
	strh r0, [r4, #0x2e]
	ldr r0, _0806AD48 @ =0x087512B0
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r2, _0806AD4C @ =0x087526C8
	ldr r0, [r4, #0x5c]
	adds r1, r2, #0
	bl sub_805660C
	bl sub_8056120
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AD40: .4byte 0x0201774C
_0806AD44: .4byte 0x08602930
_0806AD48: .4byte 0x087512B0
_0806AD4C: .4byte 0x087526C8

