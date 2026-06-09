	.section .text.s_08089D58, "ax", %progbits
@ PageSlide_OnEnd region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08089D58..0x08089D64
	.thumb
	.align 2, 0
	.global PageSlide_OnEnd
	.thumb_func
PageSlide_OnEnd:
	.incbin "baserom.gba", 0x89D58, 0xC

