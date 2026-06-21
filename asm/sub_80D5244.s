	.syntax unified
	.section .text.sub_80D5244, "ax", %progbits
@ sub_80D5244 @ JP 0x080D5244 - 4-byte BIOS SVC wrapper (svc #0x2A; bx lr), split from the MPlayExtender gbadisasm range
	.thumb
	.global sub_80D5244
	.thumb_func
sub_80D5244:
	.byte 0x2A, 0xDF, 0x70, 0x47
	.align 2, 0
