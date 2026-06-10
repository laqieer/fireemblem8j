	.section .text.s_08003800, "ax", %progbits
@ PrintEmptyStringToDBG region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003800..0x08003814
	.thumb
	.align 2, 0
	.global PrintEmptyStringToDBG
	.thumb_func
PrintEmptyStringToDBG:
	.incbin "data/residual/PrintEmptyStringToDBG.bin"

	.section .text.s_08003814, "ax", %progbits
@ ClearSmallStringBuffer region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003814..0x0800382C
	.thumb
	.align 2, 0
	.global ClearSmallStringBuffer
	.thumb_func
ClearSmallStringBuffer:
	.incbin "data/residual/ClearSmallStringBuffer.bin"

	.section .text.s_08003868, "ax", %progbits
@ StoreNumberStringOrDashesToSmallBuffer region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003868..0x08003898
	.thumb
	.align 2, 0
	.global StoreNumberStringOrDashesToSmallBuffer
	.thumb_func
StoreNumberStringOrDashesToSmallBuffer:
	.incbin "data/residual/StoreNumberStringOrDashesToSmallBuffer.bin"

	.section .text.s_08003898, "ax", %progbits
@ PrintNumberToDBG region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003898..0x080038B4
	.thumb
	.align 2, 0
	.global PrintNumberToDBG
	.thumb_func
PrintNumberToDBG:
	.incbin "data/residual/PrintNumberToDBG.bin"

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

	.section .text.s_08003C68, "ax", %progbits
@ SetTextFont region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003C68..0x08003C8C
	.thumb
	.align 2, 0
	.global SetTextFont
	.thumb_func
SetTextFont:
	.incbin "data/residual/SetTextFont.bin"

	.section .text.s_08003C8C, "ax", %progbits
@ InitText region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003C8C..0x08003CB4
	.thumb
	.align 2, 0
	.global InitText
	.thumb_func
InitText:
	.incbin "data/residual/InitText.bin"

	.section .text.s_08003CB4, "ax", %progbits
@ InitTextDb region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003CB4..0x08003CDC
	.thumb
	.align 2, 0
	.global InitTextDb
	.thumb_func
InitTextDb:
	.incbin "data/residual/InitTextDb.bin"

	.section .text.s_08003CDC, "ax", %progbits
@ InitTextInitInfo region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003CDC..0x08003CF8
	.thumb
	.align 2, 0
	.global InitTextInitInfo
	.thumb_func
InitTextInitInfo:
	.incbin "data/residual/InitTextInitInfo.bin"

	.section .text.s_08003D70, "ax", %progbits
@ Text_GetChrOffset region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003D70..0x08003D80
	.thumb
	.align 2, 0
	.global Text_GetChrOffset
	.thumb_func
Text_GetChrOffset:
	.incbin "data/residual/Text_GetChrOffset.bin"

	.section .text.s_08003D88, "ax", %progbits
@ Text_Skip region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003D88..0x08003D90
	.thumb
	.align 2, 0
	.global Text_Skip
	.thumb_func
Text_Skip:
	.incbin "data/residual/Text_Skip.bin"

	.section .text.s_08003DA0, "ax", %progbits
@ PutText region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003DA0..0x08003DEC
	.thumb
	.align 2, 0
	.global PutText
	.thumb_func
PutText:
	.incbin "data/residual/PutText.bin"

	.section .text.s_08003DEC, "ax", %progbits
@ PutBlankText region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003DEC..0x08003E0C
	.thumb
	.align 2, 0
	.global PutBlankText
	.thumb_func
PutBlankText:
	.incbin "data/residual/PutBlankText.bin"

	.section .text.s_08004120, "ax", %progbits
@ GetTextDrawDest region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08004120..0x08004140
	.thumb
	.align 2, 0
	.global GetTextDrawDest
	.thumb_func
GetTextDrawDest:
	.incbin "data/residual/GetTextDrawDest.bin"

	.section .text.s_080044E0, "ax", %progbits
@ InitSpriteText region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080044E0..0x08004504
	.thumb
	.align 2, 0
	.global InitSpriteText
	.thumb_func
InitSpriteText:
	.incbin "data/residual/InitSpriteText.bin"

	.section .text.s_080045E8, "ax", %progbits
@ GetSpriteTextDrawDest region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080045E8..0x08004608
	.thumb
	.align 2, 0
	.global GetSpriteTextDrawDest
	.thumb_func
GetSpriteTextDrawDest:
	.incbin "data/residual/GetSpriteTextDrawDest.bin"

	.section .text.s_08004874, "ax", %progbits
@ IsTextPrinting region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08004874..0x0800487C
	.thumb
	.align 2, 0
	.global IsTextPrinting
	.thumb_func
IsTextPrinting:
	.incbin "data/residual/IsTextPrinting.bin"

	.section .text.s_080048E8, "ax", %progbits
@ DrawSpecialCharGlyph_old region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080048E8..0x0800493C
	.thumb
	.align 2, 0
	.global DrawSpecialCharGlyph_old
	.thumb_func
DrawSpecialCharGlyph_old:
	.incbin "data/residual/DrawSpecialCharGlyph_old.bin"

	.section .text.s_08004A14, "ax", %progbits
@ PutSpecialChar region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08004A14..0x08004A50
	.thumb
	.align 2, 0
	.global PutSpecialChar
	.thumb_func
PutSpecialChar:
	.incbin "data/residual/PutSpecialChar.bin"

	.section .text.s_08004A90, "ax", %progbits
@ PutNumber region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08004A90..0x08004A9C
	.thumb
	.align 2, 0
	.global PutNumber
	.thumb_func
PutNumber:
	.incbin "data/residual/PutNumber.bin"

	.section .text.s_08004AEC, "ax", %progbits
@ PutNumberSmall region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08004AEC..0x08004AF8
	.thumb
	.align 2, 0
	.global PutNumberSmall
	.thumb_func
PutNumberSmall:
	.incbin "data/residual/PutNumberSmall.bin"

