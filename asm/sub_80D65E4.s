	.syntax unified
	.section .text.sub_80D65E4, "ax", %progbits
@ _call_via_sl @ JP 0x080D65E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _call_via_sl
	.thumb_func
_call_via_sl:
	bx sl
	nop
_080D65E8:
	.byte 0x58, 0x47, 0xC0, 0x46, 0x60, 0x47, 0xC0, 0x46
	.byte 0x68, 0x47, 0xC0, 0x46

