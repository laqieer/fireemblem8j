	.syntax unified
	.section .text.sub_80D65D8, "ax", %progbits
@ _call_via_r7 @ JP 0x080D65D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _call_via_r7
	.thumb_func
_call_via_r7:
	bx r7
	nop

