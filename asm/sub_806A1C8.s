	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_806A1C8, "ax", %progbits
@ sub_806A1C8 @ JP 0x0806A1C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806A1C8
	.thumb_func
sub_806A1C8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806A200 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806A204 @ =0x08602738
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806A208 @ =0x080E3DA6
	str r1, [r0, #0x48]
	ldr r1, _0806A20C @ =0x08602790
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0806A210 @ =0x08602750
	str r1, [r0, #0x54]
	ldr r1, _0806A214 @ =0x086027D0
	str r1, [r0, #0x58]
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A200: .4byte 0x0201774C
_0806A204: .4byte 0x08602738
_0806A208: .4byte 0x080E3DA6
_0806A20C: .4byte 0x08602790
_0806A210: .4byte 0x08602750
_0806A214: .4byte 0x086027D0

