	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_80655EC, "ax", %progbits
@ sub_80655EC @ JP 0x080655EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80655EC
	.thumb_func
sub_80655EC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08065640 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065644 @ =0x086014A8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	strh r1, [r0, #0x2e]
	ldr r0, _08065648 @ =0x0875AE34
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	bl sub_8056130
	ldr r0, _0806564C @ =0x0875B3C4
	ldr r1, _08065650 @ =0x02019790
	bl sub_80D6394
	bl sub_8056158
	ldr r2, _08065654 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065640: .4byte 0x0201774C
_08065644: .4byte 0x086014A8
_08065648: .4byte 0x0875AE34
_0806564C: .4byte 0x0875B3C4
_08065650: .4byte 0x02019790
_08065654: .4byte 0x03003020

