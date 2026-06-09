	.syntax unified
	.section .text.sub_80B2054, "ax", %progbits
@ sub_80B2054 @ JP 0x080B2054 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2054
	.thumb_func
sub_80B2054:
	ldr r2, _080B2074 @ =0x03003020
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
_080B2074: .4byte 0x03003020

