	.syntax unified
	.section .text.agbsyscall_80D5244, "ax", %progbits
@ Lone BIOS svc wrapper at JP 0x080D5244 (svc #0x2A; bx lr), split from the
@ MPlayExtender gbadisasm range. Reproduced as real source.
	.thumb
	.align 2, 0

	.global sub_80D5244
	.thumb_func
sub_80D5244:
	svc #0x2a
	bx lr
	.align 2, 0
