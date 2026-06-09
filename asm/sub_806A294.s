	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806A294, "ax", %progbits
@ sub_806A294 @ JP 0x0806A294 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806A294
	.thumb_func
sub_806A294:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806A2D0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806A2D4 @ =0x08602810
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806A2D8 @ =0x080E3DF6
	str r1, [r0, #0x48]
	ldr r1, _0806A2DC @ =0x08602838
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0806A2E0 @ =0x08602828
	str r1, [r0, #0x54]
	ldr r0, _0806A2E4 @ =0x087463BC
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A2D0: .4byte 0x0201774C
_0806A2D4: .4byte 0x08602810
_0806A2D8: .4byte 0x080E3DF6
_0806A2DC: .4byte 0x08602838
_0806A2E0: .4byte 0x08602828
_0806A2E4: .4byte 0x087463BC

