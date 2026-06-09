	.section .text.s_08003800, "ax", %progbits
@ PrintEmptyStringToDBG region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003800..0x08003814
	.thumb
	.align 2, 0
	.global PrintEmptyStringToDBG
	.thumb_func
PrintEmptyStringToDBG:
	.incbin "baserom.gba", 0x3800, 0x14

	.section .text.s_08003814, "ax", %progbits
@ ClearSmallStringBuffer region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003814..0x0800382C
	.thumb
	.align 2, 0
	.global ClearSmallStringBuffer
	.thumb_func
ClearSmallStringBuffer:
	.incbin "baserom.gba", 0x3814, 0x18

	.section .text.s_08003868, "ax", %progbits
@ StoreNumberStringOrDashesToSmallBuffer region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003868..0x08003898
	.thumb
	.align 2, 0
	.global StoreNumberStringOrDashesToSmallBuffer
	.thumb_func
StoreNumberStringOrDashesToSmallBuffer:
	.incbin "baserom.gba", 0x3868, 0x30

