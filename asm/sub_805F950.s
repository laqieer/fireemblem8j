	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_805F950, "ax", %progbits
@ sub_805F950 @ JP 0x0805F950 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805F950
	.thumb_func
sub_805F950:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805F98C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F990 @ =0x085FFA20
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805F994 @ =0x080E1FF2
	str r1, [r0, #0x48]
	ldr r1, _0805F998 @ =0x085FFA64
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805F99C @ =0x085FFA38
	str r1, [r0, #0x54]
	ldr r0, _0805F9A0 @ =0x08635410
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F98C: .4byte 0x0201774C
_0805F990: .4byte 0x085FFA20
_0805F994: .4byte 0x080E1FF2
_0805F998: .4byte 0x085FFA64
_0805F99C: .4byte 0x085FFA38
_0805F9A0: .4byte 0x08635410

