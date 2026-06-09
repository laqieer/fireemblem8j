	.section .text.s_08016DD4, "ax", %progbits
@ GetUnitItemSlot region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08016DD4..0x08016DFC
	.thumb
	.align 2, 0
	.global GetUnitItemSlot
	.thumb_func
GetUnitItemSlot:
	.incbin "baserom.gba", 0x16DD4, 0x28

