	.section .text.s_08073F70, "ax", %progbits
@ UnregisterEfxSoundSeExist region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08073F70..0x08073F7C
	.thumb
	.align 2, 0
	.global UnregisterEfxSoundSeExist
	.thumb_func
UnregisterEfxSoundSeExist:
	.incbin "data/sound/UnregisterEfxSoundSeExist.bin"

	.section .text.s_08073F7C, "ax", %progbits
@ RegisterEfxSoundSeExist region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08073F7C..0x08073F88
	.thumb
	.align 2, 0
	.global RegisterEfxSoundSeExist
	.thumb_func
RegisterEfxSoundSeExist:
	.incbin "data/sound/RegisterEfxSoundSeExist.bin"

	.section .text.s_08073F88, "ax", %progbits
@ CheckEfxSoundSeExist region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08073F88..0x08073F94
	.thumb
	.align 2, 0
	.global CheckEfxSoundSeExist
	.thumb_func
CheckEfxSoundSeExist:
	.incbin "data/sound/CheckEfxSoundSeExist.bin"

