	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806A358, "ax", %progbits
@ sub_806A358 @ JP 0x0806A358 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806A358
	.thumb_func
sub_806A358:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806A394 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806A398 @ =0x08602848
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806A39C @ =0x080E3E66
	str r1, [r0, #0x48]
	ldr r1, _0806A3A0 @ =0x08602874
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0806A3A4 @ =0x08602860
	str r1, [r0, #0x54]
	ldr r0, _0806A3A8 @ =0x0874D95C
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A394: .4byte 0x0201774C
_0806A398: .4byte 0x08602848
_0806A39C: .4byte 0x080E3E66
_0806A3A0: .4byte 0x08602874
_0806A3A4: .4byte 0x08602860
_0806A3A8: .4byte 0x0874D95C

