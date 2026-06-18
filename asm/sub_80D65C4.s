	.syntax unified
	.section .text.sub_80D65C4, "ax", %progbits
@ _call_via_r2 @ JP 0x080D65C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _call_via_r2
	.thumb_func
_call_via_r2:
	bx r2
	nop

