	.section .text.s_08071FAC, "ax", %progbits
@ ResetEkrDragonStatus region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08071FAC..0x08071FD8
	.thumb
	.align 2, 0
	.global ResetEkrDragonStatus
	.thumb_func
ResetEkrDragonStatus:
	.incbin "baserom.gba", 0x71FAC, 0x2C

