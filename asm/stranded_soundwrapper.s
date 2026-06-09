	.section .text.s_080021A8, "ax", %progbits
@ GetCurrentBgmSong region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080021A8..0x080021B4
	.thumb
	.align 2, 0
	.global GetCurrentBgmSong
	.thumb_func
GetCurrentBgmSong:
	.incbin "baserom.gba", 0x21A8, 0xC

	.section .text.s_080021B4, "ax", %progbits
@ IsBgmPlaying region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080021B4..0x080021C4
	.thumb
	.align 2, 0
	.global IsBgmPlaying
	.thumb_func
IsBgmPlaying:
	.incbin "baserom.gba", 0x21B4, 0x10

