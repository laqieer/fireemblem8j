	.syntax unified
	.section .text.sub_80D65CC, "ax", %progbits
@ _call_via_r4 @ JP 0x080D65CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _call_via_r4
	.thumb_func
_call_via_r4:
	bx r4
	nop

