	.section .text.s_08003868, "ax", %progbits
@ StoreNumberStringOrDashesToSmallBuffer region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003868..0x08003898
	.thumb
	.align 2, 0
	.global StoreNumberStringOrDashesToSmallBuffer
	.thumb_func
StoreNumberStringOrDashesToSmallBuffer:
	.incbin "data/residual/StoreNumberStringOrDashesToSmallBuffer.bin"

	.section .text.s_08003900, "ax", %progbits
@ PrintHexNumberToDBG region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003900..0x0800391C
	.thumb
	.align 2, 0
	.global PrintHexNumberToDBG
	.thumb_func
PrintHexNumberToDBG:
	.incbin "data/residual/PrintHexNumberToDBG.bin"

	.section .text.s_0800391C, "ax", %progbits
@ PrintStringToDBG region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0800391C..0x08003988
	.thumb
	.align 2, 0
	.global PrintStringToDBG
	.thumb_func
PrintStringToDBG:
	.incbin "data/residual/PrintStringToDBG.bin"

	.section .text.s_08003A08, "ax", %progbits
@ UpdateDBGScroll region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003A08..0x08003A70
	.thumb
	.align 2, 0
	.global UpdateDBGScroll
	.thumb_func
UpdateDBGScroll:
	.incbin "data/residual/UpdateDBGScroll.bin"

	.section .text.s_08003B48, "ax", %progbits
@ PrintNumberAsOBJ region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003B48..0x08003B6C
	.thumb
	.align 2, 0
	.global PrintNumberAsOBJ
	.thumb_func
PrintNumberAsOBJ:
	.incbin "data/residual/PrintNumberAsOBJ.bin"

	.section .text.s_08003B6C, "ax", %progbits
@ PrintHexNumberAsOBJ region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003B6C..0x08003B90
	.thumb
	.align 2, 0
	.global PrintHexNumberAsOBJ
	.thumb_func
PrintHexNumberAsOBJ:
	.incbin "data/residual/PrintHexNumberAsOBJ.bin"

	.section .text.s_08004A14, "ax", %progbits
@ PutSpecialChar region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08004A14..0x08004A50
	.thumb
	.align 2, 0
	.global PutSpecialChar
	.thumb_func
PutSpecialChar:
	.incbin "data/residual/PutSpecialChar.bin"
