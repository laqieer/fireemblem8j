	.syntax unified
	.set sub_8001ACC, 0x08001ACC + 1
	.section .text.sub_80877C8, "ax", %progbits
@ sub_80877C8 @ JP 0x080877C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80877C8
	.thumb_func
sub_80877C8:
	push {lr}
	movs r0, #0
	bl sub_8001ACC
	ldr r2, _080877F4 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080877F4: .4byte 0x03003020

