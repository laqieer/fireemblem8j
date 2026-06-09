	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_805D800, "ax", %progbits
@ sub_805D800 @ JP 0x0805D800 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805D800
	.thumb_func
sub_805D800:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0805D848 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D84C @ =0x085FF3A0
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0805D850 @ =0x080E1966
	str r1, [r0, #0x48]
	ldr r1, _0805D854 @ =0x085FF3B8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805D858 @ =0x085FF424
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	lsls r4, r4, #5
	ldr r0, _0805D85C @ =0x087A4DA4
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D848: .4byte 0x0201774C
_0805D84C: .4byte 0x085FF3A0
_0805D850: .4byte 0x080E1966
_0805D854: .4byte 0x085FF3B8
_0805D858: .4byte 0x085FF424
_0805D85C: .4byte 0x087A4DA4

