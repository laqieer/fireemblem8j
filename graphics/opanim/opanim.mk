# graphics/opanim -- per-subsystem asset wiring (parallel-safe pin mechanism).
# Auto-included by the root Makefile via `-include $(GRAPHICS_MK)`. See
# graphics/misc/misc.mk for the convention.
#
# asm/dat_data_opanim_gfx_p*.s .incbin the opening-animation (op-anim) graphics:
# the IS/intro logos, the world-map & character backgrounds, the close-up
# character cut-ins, the divine-eye/shining-ring effects, and the 100 scrolling-
# background sheets. Region-SAME with US (graphics/op_anim). Per asset class:
#   Img_*/img_opanim* -> .4bpp.lz   (committed PNG -> 4bpp -> LZ77)
#   Tsa_*             -> .map.bin.lz (committed .map.bin -> LZ77) or .map.bin verbatim
#   tsa_opanim*       -> .map.bin    (committed binary, incbin'd verbatim)
#   Pal_*/pal_*       -> .gbapal     (committed JASC .pal, or PNG-embedded palette)
# The FE-specific .feimg4.bin.lz / .fetsa4.bin.lz assets (20 Img_/Tsa_ symbols:
# WorldMap[Fog], Ephraim, Eirika[Blur1-3], GenericCharacterBG, IntelligentSystems)
# need the FE TSA-splitter tool (FETSATOOL), which this repo does not yet have, so
# they are HONESTLY left as .incbin "baserom.gba" pending that tool.
#
# -mindist: the 71 LZ assets below need mindist 1 (discovered by a 1/2/3 sweep);
# all other LZ assets use gbagfx's default mindist 2.















# --- mindist-1 pins ---
graphics/opanim/OpAnimCharacterBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/opanim/OpAnimEphraimBlur2.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/opanim/OpAnimShiningRingBlinking.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim10.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim11.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim12.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim13.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim14.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim16.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim17.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim18.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim20.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim23.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim24.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim25.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim26.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim27.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim3.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim30.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim31.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim32.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim33.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim34.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim35.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim37.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim38.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim39.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim4.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim40.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim43.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim45.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim46.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim47.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim48.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim49.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim5.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim51.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim52.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim53.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim56.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim57.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim58.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim59.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim60.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim61.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim62.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim63.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim64.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim65.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim66.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim67.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim68.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim69.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim7.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim71.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim73.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim74.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim76.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim77.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim78.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim79.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim8.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim81.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim82.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim83.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim84.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim9.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim90.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim93.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim95.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/opanim/opanim97.4bpp.lz: LZ_FLAGS := -mindist 1
