	.syntax unified
	.set sub_8001ACC, 0x08001ACC + 1
	.section .text.sub_80B50D4, "ax", %progbits
@ sub_80B50D4 @ JP 0x080B50D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B50D4
	.thumb_func
sub_80B50D4:
	push {lr}
	movs r1, #4
	str r1, [r0, #0x58]
	ldr r0, _080B5108 @ =0x08A9E4B8
	bl sub_8001ACC
	ldr r2, _080B510C @ =0x03003020
	ldrb r1, [r2]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, #0x15]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #0x15]
	pop {r0}
	bx r0
	.align 2, 0
_080B5108: .4byte 0x08A9E4B8
_080B510C: .4byte 0x03003020

