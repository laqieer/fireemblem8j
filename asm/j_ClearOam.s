	.syntax unified
	.section .text.j_ClearOam, "ax", %progbits
@ j_ClearOam @ JP 0x080DC0D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global j_ClearOam
	.thumb_func
j_ClearOam:
	bx pc
	nop
_080DC0D8:
	.byte 0x89, 0x90, 0xFC, 0xEA

