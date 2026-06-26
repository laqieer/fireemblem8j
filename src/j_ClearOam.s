	.syntax unified
	.section .text.j_ClearOam, "ax", %progbits
@ j_ClearOam @ JP 0x080DC0D4 - thumb->arm interwork veneer to ClearOam (0x08000304).
@ region-different (fe8u ships the same veneer as ClearOAMBuffer @ 0x080D7498 in
@ asm/arm_call.s). The bx pc switches to ARM, nop aligns, then `b ClearOam`.
	.thumb
	.global j_ClearOam
	.thumb_func
j_ClearOam:
	bx pc
	nop
	.arm
	b ClearOam
	.thumb
