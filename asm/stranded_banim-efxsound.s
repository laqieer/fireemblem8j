	.section .text.s_08073F70, "ax", %progbits
@ UnregisterEfxSoundSeExist region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08073F70..0x08073F7C
	.thumb
	.align 2, 0
	.global UnregisterEfxSoundSeExist
	.thumb_func
UnregisterEfxSoundSeExist:
	.incbin "baserom.gba", 0x73F70, 0xC

