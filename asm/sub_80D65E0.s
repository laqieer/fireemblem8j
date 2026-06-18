	.syntax unified
	.section .text.sub_80D65E0, "ax", %progbits
@ _call_via_r9 @ JP 0x080D65E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _call_via_r9
	.thumb_func
_call_via_r9:
	bx sb
	nop

