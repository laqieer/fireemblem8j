	.syntax unified
	.section .text.sub_80D65C0, "ax", %progbits
@ _call_via_r1 @ JP 0x080D65C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _call_via_r1
	.thumb_func
_call_via_r1:
	bx r1
	nop

