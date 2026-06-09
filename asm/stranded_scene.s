	.section .text.s_08006974, "ax", %progbits
@ StartTalk region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08006974..0x08006980
	.thumb
	.align 2, 0
	.global StartTalk
	.thumb_func
StartTalk:
	.incbin "baserom.gba", 0x6974, 0xC

