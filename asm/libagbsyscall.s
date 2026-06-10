	.section .text.libagbsyscall, "ax", %progbits
@ libagbsyscall region-same asm TU: JP 0x080D63AC (US 0x080D16B0, shift +0x4CFC); descriptive incbin baserom.gba
	.thumb
	.align 2, 0
	.global SoftReset
	.thumb_func
SoftReset:
	.incbin "data/residual/SoftReset.bin"
