	.section .text.s_08006974, "ax", %progbits
@ StartTalk region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08006974..0x08006980
	.thumb
	.align 2, 0
	.global StartTalk
	.thumb_func
StartTalk:
	.incbin "data/residual/StartTalk.bin"

	.section .text.s_080079AC, "ax", %progbits
@ TalkFaceMove_OnInit region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080079AC..0x08007A08
	.thumb
	.align 2, 0
	.global TalkFaceMove_OnInit
	.thumb_func
TalkFaceMove_OnInit:
	.incbin "data/residual/TalkFaceMove_OnInit.bin"

	.section .text.s_080088B4, "ax", %progbits
@ SetTalkFaceMouthMove region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080088B4..0x080088C0
	.thumb
	.align 2, 0
	.global SetTalkFaceMouthMove
	.thumb_func
SetTalkFaceMouthMove:
	.incbin "data/residual/SetTalkFaceMouthMove.bin"

	.section .text.s_080088C0, "ax", %progbits
@ SetTalkFaceNoMouthMove region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080088C0..0x080088CC
	.thumb
	.align 2, 0
	.global SetTalkFaceNoMouthMove
	.thumb_func
SetTalkFaceNoMouthMove:
	.incbin "data/residual/SetTalkFaceNoMouthMove.bin"

