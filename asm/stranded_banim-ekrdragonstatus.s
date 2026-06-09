	.section .text.s_08071FAC, "ax", %progbits
@ ResetEkrDragonStatus region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08071FAC..0x08071FD8
	.thumb
	.align 2, 0
	.global ResetEkrDragonStatus
	.thumb_func
ResetEkrDragonStatus:
	.incbin "baserom.gba", 0x71FAC, 0x2C

	.section .text.s_08072048, "ax", %progbits
@ GetEkrDragonStatusUnk1 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08072048..0x08072054
	.thumb
	.align 2, 0
	.global GetEkrDragonStatusUnk1
	.thumb_func
GetEkrDragonStatusUnk1:
	.incbin "baserom.gba", 0x72048, 0xC

	.section .text.s_08072054, "ax", %progbits
@ SetEkrDragonStatusUnk1 region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08072054..0x08072060
	.thumb
	.align 2, 0
	.global SetEkrDragonStatusUnk1
	.thumb_func
SetEkrDragonStatusUnk1:
	.incbin "baserom.gba", 0x72054, 0xC

