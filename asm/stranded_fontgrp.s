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

	.section .text.s_08003898, "ax", %progbits
@ PrintNumberToDBG region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003898..0x080038B4
	.thumb
	.align 2, 0
	.global PrintNumberToDBG
	.thumb_func
PrintNumberToDBG:
	.incbin "baserom.gba", 0x3898, 0x1C

	.section .text.s_08003900, "ax", %progbits
@ PrintHexNumberToDBG region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003900..0x0800391C
	.thumb
	.align 2, 0
	.global PrintHexNumberToDBG
	.thumb_func
PrintHexNumberToDBG:
	.incbin "baserom.gba", 0x3900, 0x1C

	.section .text.s_0800391C, "ax", %progbits
@ PrintStringToDBG region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0800391C..0x08003988
	.thumb
	.align 2, 0
	.global PrintStringToDBG
	.thumb_func
PrintStringToDBG:
	.incbin "baserom.gba", 0x391C, 0x6C

	.section .text.s_08003A08, "ax", %progbits
@ UpdateDBGScroll region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003A08..0x08003A70
	.thumb
	.align 2, 0
	.global UpdateDBGScroll
	.thumb_func
UpdateDBGScroll:
	.incbin "baserom.gba", 0x3A08, 0x68

	.section .text.s_08003B48, "ax", %progbits
@ PrintNumberAsOBJ region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003B48..0x08003B6C
	.thumb
	.align 2, 0
	.global PrintNumberAsOBJ
	.thumb_func
PrintNumberAsOBJ:
	.incbin "baserom.gba", 0x3B48, 0x24

	.section .text.s_08003B6C, "ax", %progbits
@ PrintHexNumberAsOBJ region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003B6C..0x08003B90
	.thumb
	.align 2, 0
	.global PrintHexNumberAsOBJ
	.thumb_func
PrintHexNumberAsOBJ:
	.incbin "baserom.gba", 0x3B6C, 0x24

	.section .text.s_08003C68, "ax", %progbits
@ SetTextFont region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003C68..0x08003C8C
	.thumb
	.align 2, 0
	.global SetTextFont
	.thumb_func
SetTextFont:
	.incbin "baserom.gba", 0x3C68, 0x24

	.section .text.s_08003C8C, "ax", %progbits
@ InitText region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003C8C..0x08003CB4
	.thumb
	.align 2, 0
	.global InitText
	.thumb_func
InitText:
	.incbin "baserom.gba", 0x3C8C, 0x28

	.section .text.s_08003CB4, "ax", %progbits
@ InitTextDb region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003CB4..0x08003CDC
	.thumb
	.align 2, 0
	.global InitTextDb
	.thumb_func
InitTextDb:
	.incbin "baserom.gba", 0x3CB4, 0x28

	.section .text.s_08003CDC, "ax", %progbits
@ InitTextInitInfo region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003CDC..0x08003CF8
	.thumb
	.align 2, 0
	.global InitTextInitInfo
	.thumb_func
InitTextInitInfo:
	.incbin "baserom.gba", 0x3CDC, 0x1C

	.section .text.s_08003D70, "ax", %progbits
@ Text_GetChrOffset region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003D70..0x08003D80
	.thumb
	.align 2, 0
	.global Text_GetChrOffset
	.thumb_func
Text_GetChrOffset:
	.incbin "baserom.gba", 0x3D70, 0x10

	.section .text.s_08003D88, "ax", %progbits
@ Text_Skip region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003D88..0x08003D90
	.thumb
	.align 2, 0
	.global Text_Skip
	.thumb_func
Text_Skip:
	.incbin "baserom.gba", 0x3D88, 0x8

	.section .text.s_08003DA0, "ax", %progbits
@ PutText region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003DA0..0x08003DEC
	.thumb
	.align 2, 0
	.global PutText
	.thumb_func
PutText:
	.incbin "baserom.gba", 0x3DA0, 0x4C

	.section .text.s_08003DEC, "ax", %progbits
@ PutBlankText region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08003DEC..0x08003E0C
	.thumb
	.align 2, 0
	.global PutBlankText
	.thumb_func
PutBlankText:
	.incbin "baserom.gba", 0x3DEC, 0x20

	.section .text.s_08004120, "ax", %progbits
@ GetTextDrawDest region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08004120..0x08004140
	.thumb
	.align 2, 0
	.global GetTextDrawDest
	.thumb_func
GetTextDrawDest:
	.incbin "baserom.gba", 0x4120, 0x20

	.section .text.s_080044E0, "ax", %progbits
@ InitSpriteText region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080044E0..0x08004504
	.thumb
	.align 2, 0
	.global InitSpriteText
	.thumb_func
InitSpriteText:
	.incbin "baserom.gba", 0x44E0, 0x24

	.section .text.s_080045E8, "ax", %progbits
@ GetSpriteTextDrawDest region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080045E8..0x08004608
	.thumb
	.align 2, 0
	.global GetSpriteTextDrawDest
	.thumb_func
GetSpriteTextDrawDest:
	.incbin "baserom.gba", 0x45E8, 0x20

	.section .text.s_08004874, "ax", %progbits
@ IsTextPrinting region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08004874..0x0800487C
	.thumb
	.align 2, 0
	.global IsTextPrinting
	.thumb_func
IsTextPrinting:
	.incbin "baserom.gba", 0x4874, 0x8

	.section .text.s_080048E8, "ax", %progbits
@ DrawSpecialCharGlyph_old region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080048E8..0x0800493C
	.thumb
	.align 2, 0
	.global DrawSpecialCharGlyph_old
	.thumb_func
DrawSpecialCharGlyph_old:
	.incbin "baserom.gba", 0x48E8, 0x54

