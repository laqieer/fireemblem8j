	.syntax unified
	.section .text.sub_80D65D0, "ax", %progbits
@ _call_via_r5 @ JP 0x080D65D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _call_via_r5
	.thumb_func
_call_via_r5:
	bx r5
	nop

