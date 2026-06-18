	.syntax unified
	.section .text.sub_80D65DC, "ax", %progbits
@ _call_via_r8 @ JP 0x080D65DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _call_via_r8
	.thumb_func
_call_via_r8:
	bx r8
	nop

