	.syntax unified
	.section .text.sub_80D65C8, "ax", %progbits
@ _call_via_r3 @ JP 0x080D65C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _call_via_r3
	.thumb_func
_call_via_r3:
	bx r3
	nop

