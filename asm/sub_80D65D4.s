	.syntax unified
	.section .text.sub_80D65D4, "ax", %progbits
@ _call_via_r6 @ JP 0x080D65D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _call_via_r6
	.thumb_func
_call_via_r6:
	bx r6
	nop

