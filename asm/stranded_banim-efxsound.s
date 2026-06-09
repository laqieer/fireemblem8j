	.section .text.s_08073F70, "ax", %progbits
@ UnregisterEfxSoundSeExist region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08073F70..0x08073F7C
	.thumb
	.align 2, 0
	.global UnregisterEfxSoundSeExist
	.thumb_func
UnregisterEfxSoundSeExist:
	.incbin "baserom.gba", 0x73F70, 0xC

	.section .text.s_08073F7C, "ax", %progbits
@ RegisterEfxSoundSeExist region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08073F7C..0x08073F88
	.thumb
	.align 2, 0
	.global RegisterEfxSoundSeExist
	.thumb_func
RegisterEfxSoundSeExist:
	.incbin "baserom.gba", 0x73F7C, 0xC

