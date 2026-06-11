	.section .text.s_08089D58, "ax", %progbits
@ PageSlide_OnEnd region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08089D58..0x08089D64
	.thumb
	.align 2, 0
	.global PageSlide_OnEnd
	.thumb_func
PageSlide_OnEnd:
	.incbin "data/residual/PageSlide_OnEnd.bin"

	.section .text.s_0808AE8C, "ax", %progbits
@ HbPopulate_SSClass region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0808AE8C..0x0808AEA0
	.thumb
	.align 2, 0
	.global HbPopulate_SSClass
	.thumb_func
HbPopulate_SSClass:
	.incbin "data/residual/HbPopulate_SSClass.bin"

