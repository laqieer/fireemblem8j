	.section .text.s_080021A8, "ax", %progbits
@ GetCurrentBgmSong region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080021A8..0x080021B4
	.thumb
	.align 2, 0
	.global GetCurrentBgmSong
	.thumb_func
GetCurrentBgmSong:
	.incbin "data/sound/GetCurrentBgmSong.bin"

	.section .text.s_080021B4, "ax", %progbits
@ IsBgmPlaying region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080021B4..0x080021C4
	.thumb
	.align 2, 0
	.global IsBgmPlaying
	.thumb_func
IsBgmPlaying:
	.incbin "data/sound/IsBgmPlaying.bin"

	.section .text.s_08002820, "ax", %progbits
@ Sound_SetDefaultMaxNumChannels region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002820..0x08002838
	.thumb
	.align 2, 0
	.global Sound_SetDefaultMaxNumChannels
	.thumb_func
Sound_SetDefaultMaxNumChannels:
	.incbin "data/sound/Sound_SetDefaultMaxNumChannels.bin"

	.section .text.s_080029D8, "ax", %progbits
@ Sound_ForceChangeBgm region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080029D8..0x08002A08
	.thumb
	.align 2, 0
	.global Sound_ForceChangeBgm
	.thumb_func
Sound_ForceChangeBgm:
	.incbin "data/sound/Sound_ForceChangeBgm.bin"

