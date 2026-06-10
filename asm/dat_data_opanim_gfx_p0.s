	.section .rodata.dat_data_opanim_gfx_p0, "a", %progbits
@ src/data/data_opanim_gfx.o: region-same content at JP 0x08b4bba0 (US 0x08ab21d8, shift -0xFFF66638); EXTRACTED to graphics/opanim/ except 10 FE-format (.feimg/.fetsa) symbol(s) still incbin baserom.gba (need FETSATOOL)
	.global Img_OpAnimWorldMap
Img_OpAnimWorldMap:
	.incbin "graphics/misc_gfx/Img_OpAnimWorldMap.bin.lz"
	.global Tsa_OpAnimWorldMap
Tsa_OpAnimWorldMap:
	.incbin "graphics/misc_gfx/Tsa_OpAnimWorldMap.bin.lz"
	.global Pal_OpAnimWorldMap
Pal_OpAnimWorldMap:
	.incbin "graphics/opanim/OpAnimWorldMap.gbapal"
	.global Img_OpAnimWorldMapFog
Img_OpAnimWorldMapFog:
	.incbin "graphics/misc_gfx/Pal_OpAnimWorldMap.bin.lz"
	.global Tsa_OpAnimWorldMapFog
Tsa_OpAnimWorldMapFog:
	.incbin "graphics/misc_gfx/Tsa_OpAnimWorldMapFog.bin.lz"
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
	.incbin "graphics/misc_gfx/Pal_OpAnimWorldMapFog.bin.lz"
	.global Tsa_OpAnimGenericCharacterBG
Tsa_OpAnimGenericCharacterBG:
	.incbin "graphics/misc_gfx/Tsa_OpAnimGenericCharacterBG.bin.lz"
	.global gOpanimGfx_0
gOpanimGfx_0:
	.incbin "graphics/opanim/OpAnimGenericCharacterBGUnused.gbapal"
	.incbin "graphics/opanim/OpAnimGenericCharacterBGUnused.4bpp.lz"
	.incbin "graphics/opanim/OpAnimGenericCharacterBGUnused.map.bin.lz"
	.incbin "graphics/opanim/OpAnimGenericCharacterBGUnusedPal2.gbapal"
	.global Img_OpAnimEphraim
Img_OpAnimEphraim:
	.incbin "graphics/misc_gfx/Img_OpAnimEphraim.bin.lz"
	.global Tsa_OpAnimEphraim
Tsa_OpAnimEphraim:
	.incbin "graphics/misc_gfx/Tsa_OpAnimEphraim.bin.lz"
	.global Img_OpAnimEphraimBlur1
Img_OpAnimEphraimBlur1:
	.incbin "graphics/misc_gfx/Img_OpAnimEphraimBlur1.bin.lz"
	.global Tsa_OpAnimEphraimBlur1
Tsa_OpAnimEphraimBlur1:
	.incbin "graphics/misc_gfx/Tsa_OpAnimEphraimBlur1.bin.lz"
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
