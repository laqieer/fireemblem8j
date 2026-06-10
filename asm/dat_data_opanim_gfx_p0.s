	.section .rodata.dat_data_opanim_gfx_p0, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b4bba0 (US 0x08ab21d8, shift -0xFFF66638); EXTRACTED to graphics/opanim/ except 10 FE-format (.feimg/.fetsa) symbol(s) still incbin baserom.gba (need FETSATOOL)
	.global Img_OpAnimWorldMap
Img_OpAnimWorldMap:
	.incbin "baserom.gba", 0xB4BBA0, 0x3BB8
	.global Tsa_OpAnimWorldMap
Tsa_OpAnimWorldMap:
	.incbin "baserom.gba", 0xB4F758, 0x57C
	.global Pal_OpAnimWorldMap
Pal_OpAnimWorldMap:
	.incbin "graphics/opanim/OpAnimWorldMap.gbapal"
	.global Img_OpAnimWorldMapFog
Img_OpAnimWorldMapFog:
	.incbin "baserom.gba", 0xB4FCF4, 0x1794
	.global Tsa_OpAnimWorldMapFog
Tsa_OpAnimWorldMapFog:
	.incbin "baserom.gba", 0xB51488, 0x2F0
	.global Pal_OpAnimWorldMapFog
Pal_OpAnimWorldMapFog:
	.incbin "graphics/opanim/OpAnimWorldMapFog.gbapal"
	.global Img_OpAnimCharacterBG
Img_OpAnimCharacterBG:
	.incbin "graphics/opanim/OpAnimCharacterBG.4bpp.lz"
	.global Tsa_OpAnimCharacterBG
Tsa_OpAnimCharacterBG:
	.incbin "graphics/opanim/OpAnimCharacterBG.map.bin.lz"
	.global Pal_OpAnimCharacterBG
Pal_OpAnimCharacterBG:
	.incbin "graphics/opanim/OpAnimCharacterBG.gbapal"
	.global Img_OpAnimGenericCharacterBG
Img_OpAnimGenericCharacterBG:
	.incbin "baserom.gba", 0xB52694, 0x760
	.global Tsa_OpAnimGenericCharacterBG
Tsa_OpAnimGenericCharacterBG:
	.incbin "baserom.gba", 0xB52DF4, 0x440
	.global gOpanimGfx_0
gOpanimGfx_0:
	.incbin "graphics/opanim/OpAnimGenericCharacterBGUnused.gbapal"
	.incbin "graphics/opanim/OpAnimGenericCharacterBGUnused.4bpp.lz"
	.incbin "graphics/opanim/OpAnimGenericCharacterBGUnused.map.bin.lz"
	.incbin "graphics/opanim/OpAnimGenericCharacterBGUnusedPal2.gbapal"
	.global Img_OpAnimEphraim
Img_OpAnimEphraim:
	.incbin "baserom.gba", 0xB54B14, 0xF28
	.global Tsa_OpAnimEphraim
Tsa_OpAnimEphraim:
	.incbin "baserom.gba", 0xB55A3C, 0x1B8
	.global Img_OpAnimEphraimBlur1
Img_OpAnimEphraimBlur1:
	.incbin "baserom.gba", 0xB55BF4, 0xF48
	.global Tsa_OpAnimEphraimBlur1
Tsa_OpAnimEphraimBlur1:
	.incbin "baserom.gba", 0xB56B3C, 0x1D4
	.global Img_OpAnimEphraimBlur2
Img_OpAnimEphraimBlur2:
	.incbin "graphics/opanim/OpAnimEphraimBlur2.4bpp.lz"
	.global Tsa_OpAnimEphraimBlur2
Tsa_OpAnimEphraimBlur2:
	.incbin "graphics/opanim/OpAnimEphraimBlur2.map.bin.lz"
	.global Img_OpAnimEphraimBlur3
Img_OpAnimEphraimBlur3:
	.incbin "graphics/opanim/OpAnimEphraimBlur3.4bpp.lz"
	.global Tsa_OpAnimEphraimBlur3
Tsa_OpAnimEphraimBlur3:
	.incbin "graphics/opanim/OpAnimEphraimBlur3.map.bin.lz"
	.global Img_OpAnimEphraimClose1
Img_OpAnimEphraimClose1:
	.incbin "graphics/opanim/OpAnimEphraimClose1.4bpp.lz"
	.global Img_OpAnimEphraimClose2
Img_OpAnimEphraimClose2:
	.incbin "graphics/opanim/OpAnimEphraimClose2.4bpp.lz"
	.global Tsa_OpAnimEphraimClose1
Tsa_OpAnimEphraimClose1:
	.incbin "graphics/opanim/OpAnimEphraimClose1.map.bin.lz"
