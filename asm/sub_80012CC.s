	.syntax unified
	.section .text.sub_80012CC, "ax", %progbits
@ sub_80012CC @ JP 0x080012CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80012CC
	.thumb_func
sub_80012CC:
	ldr r1, _080012D4 @ =0x03003020
	strb r0, [r1, #5]
	bx lr
	.align 2, 0
_080012D4: .4byte 0x03003020

