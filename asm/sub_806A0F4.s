	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806A0F4, "ax", %progbits
@ sub_806A0F4 @ JP 0x0806A0F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806A0F4
	.thumb_func
sub_806A0F4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806A134 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806A138 @ =0x08602718
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	strh r1, [r0, #0x32]
	ldr r1, _0806A13C @ =0x080E3D92
	str r1, [r0, #0x48]
	ldr r1, _0806A140 @ =0x08602734
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0806A144 @ =0x08602730
	str r1, [r0, #0x54]
	ldr r0, _0806A148 @ =0x0872DF78
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A134: .4byte 0x0201774C
_0806A138: .4byte 0x08602718
_0806A13C: .4byte 0x080E3D92
_0806A140: .4byte 0x08602734
_0806A144: .4byte 0x08602730
_0806A148: .4byte 0x0872DF78

