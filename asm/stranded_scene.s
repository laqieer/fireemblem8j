	.section .text.s_08006974, "ax", %progbits
@ StartTalk region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08006974..0x08006980
	.thumb
	.align 2, 0
	.global StartTalk
	.thumb_func
StartTalk:
	.incbin "baserom.gba", 0x6974, 0xC

	.section .text.s_080079AC, "ax", %progbits
@ TalkFaceMove_OnInit region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080079AC..0x08007A08
	.thumb
	.align 2, 0
	.global TalkFaceMove_OnInit
	.thumb_func
TalkFaceMove_OnInit:
	.incbin "baserom.gba", 0x79AC, 0x5C

