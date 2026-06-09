	.syntax unified
	.section .text.sub_80878A0, "ax", %progbits
@ sub_80878A0 @ JP 0x080878A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80878A0
	.thumb_func
sub_80878A0:
	ldr r2, _080878C0 @ =0x03003020
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
	bx lr
	.align 2, 0
_080878C0: .4byte 0x03003020

