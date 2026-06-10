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

asm/dat_data_opanim_gfx_p0.o: \
  graphics/opanim/OpAnimCharacterBG.4bpp.lz \
  graphics/opanim/OpAnimCharacterBG.gbapal \
  graphics/opanim/OpAnimCharacterBG.map.bin.lz \
  graphics/opanim/OpAnimEphraimBlur2.4bpp.lz \
  graphics/opanim/OpAnimEphraimBlur2.map.bin.lz \
  graphics/opanim/OpAnimEphraimBlur3.4bpp.lz \
  graphics/opanim/OpAnimEphraimBlur3.map.bin.lz \
  graphics/opanim/OpAnimEphraimClose1.4bpp.lz \
  graphics/opanim/OpAnimEphraimClose1.map.bin.lz \
  graphics/opanim/OpAnimEphraimClose2.4bpp.lz \
  graphics/opanim/OpAnimGenericCharacterBGUnused.4bpp.lz \
  graphics/opanim/OpAnimGenericCharacterBGUnused.gbapal \
  graphics/opanim/OpAnimGenericCharacterBGUnused.map.bin.lz \
  graphics/opanim/OpAnimGenericCharacterBGUnusedPal2.gbapal \
  graphics/opanim/OpAnimWorldMap.gbapal \
  graphics/opanim/OpAnimWorldMapFog.gbapal

asm/dat_data_opanim_gfx_p1.o: \
  graphics/opanim/OpAnimEirika.gbapal \
  graphics/opanim/OpAnimEirikaClose1.4bpp.lz \
  graphics/opanim/OpAnimEirikaClose1.map.bin.lz \
  graphics/opanim/OpAnimEirikaClose2.4bpp.lz \
  graphics/opanim/OpAnimEirikaClose2.map.bin.lz \
  graphics/opanim/OpAnimEphraim.gbapal \
  graphics/opanim/OpAnimJoshua.4bpp.lz \
  graphics/opanim/OpAnimJoshua.map.bin.lz \
  graphics/opanim/OpAnimJoshua2.4bpp.lz

asm/dat_data_opanim_gfx_p11.o: \
  graphics/opanim/OpAnimFaceGilliam.4bpp.lz \
  graphics/opanim/OpAnimFaceGilliam.gbapal \
  graphics/opanim/OpAnimFaceGilliamShadow.4bpp.lz \
  graphics/opanim/OpAnimFaceInnes.4bpp.lz \
  graphics/opanim/OpAnimFaceInnes.gbapal \
  graphics/opanim/OpAnimFaceInnesShadow.4bpp.lz \
  graphics/opanim/OpAnimFaceMoulder.4bpp.lz \
  graphics/opanim/OpAnimFaceMoulder.gbapal \
  graphics/opanim/OpAnimFaceMoulderShadow.4bpp.lz \
  graphics/opanim/OpAnimFaceRoss.gbapal \
  graphics/opanim/OpAnimFaceSyrene.4bpp.lz \
  graphics/opanim/OpAnimFaceSyrene.gbapal \
  graphics/opanim/OpAnimFaceSyreneShadow.4bpp.lz \
  graphics/opanim/OpAnimFaceTana.4bpp.lz \
  graphics/opanim/OpAnimFaceTana.gbapal \
  graphics/opanim/OpAnimFaceTanaShadow.4bpp.lz \
  graphics/opanim/OpAnimFaceVanessa.4bpp.lz \
  graphics/opanim/OpAnimFaceVanessa.gbapal \
  graphics/opanim/OpAnimFaceVanessaShadow.4bpp.lz

asm/dat_data_opanim_gfx_p18.o: \
  graphics/opanim/OpAnimFaceArtur.gbapal \
  graphics/opanim/OpAnimFaceForde.4bpp.lz \
  graphics/opanim/OpAnimFaceForde.gbapal \
  graphics/opanim/OpAnimFaceFordeShadow.4bpp.lz \
  graphics/opanim/OpAnimFaceFranz.4bpp.lz \
  graphics/opanim/OpAnimFaceFranz.gbapal \
  graphics/opanim/OpAnimFaceFranzShadow.4bpp.lz \
  graphics/opanim/OpAnimFaceKyle.4bpp.lz \
  graphics/opanim/OpAnimFaceKyle.gbapal \
  graphics/opanim/OpAnimFaceKyleShadow.4bpp.lz \
  graphics/opanim/OpAnimFaceSeth.4bpp.lz \
  graphics/opanim/OpAnimFaceSeth.gbapal \
  graphics/opanim/OpAnimFaceSethShadow.4bpp.lz

asm/dat_data_opanim_gfx_p2.o: \
  graphics/opanim/OpAnimJoshua.gbapal \
  graphics/opanim/OpAnimLArachel.4bpp.lz \
  graphics/opanim/OpAnimLArachel.gbapal \
  graphics/opanim/OpAnimLArachel.map.bin.lz \
  graphics/opanim/OpAnimLArachel2.4bpp.lz \
  graphics/opanim/OpAnimLArachel2.map.bin.lz \
  graphics/opanim/OpAnimSeth.4bpp.lz \
  graphics/opanim/OpAnimSeth.map.bin.lz \
  graphics/opanim/OpAnimSeth2.4bpp.lz

asm/dat_data_opanim_gfx_p22.o: \
  graphics/opanim/OpAnimFaceCaellach.gbapal \
  graphics/opanim/OpAnimFaceLyon.4bpp.lz \
  graphics/opanim/OpAnimFaceLyonShadow.4bpp.lz

asm/dat_data_opanim_gfx_p23.o: \
  graphics/opanim/OpAnimFaceVigarde.4bpp.lz \
  graphics/opanim/OpAnimFaceVigardeShadow.4bpp.lz

asm/dat_data_opanim_gfx_p24.o: \
  graphics/opanim/opanim_08AF1B38.4bpp.lz \
  graphics/opanim/opanim_08AF1B38.gbapal \
  graphics/opanim/split_line.4bpp.lz \
  graphics/opanim/split_line.gbapal

asm/dat_data_opanim_gfx_p25.o: \
  graphics/opanim/08B103D8.gbapal \
  graphics/opanim/OpAnimShiningRing.4bpp.lz \
  graphics/opanim/OpAnimShiningRing.gbapal \
  graphics/opanim/OpAnimShiningRing.map.bin.lz \
  graphics/opanim/OpAnimShiningRingBlinking.map.bin.lz \
  graphics/opanim/devil_eye.4bpp.lz \
  graphics/opanim/devil_eye.gbapal \
  graphics/opanim/eph_eirika_name.gbapal \
  graphics/opanim/opanim1.4bpp.lz \
  graphics/opanim/opanim10.4bpp.lz \
  graphics/opanim/opanim100.4bpp.lz \
  graphics/opanim/opanim11.4bpp.lz \
  graphics/opanim/opanim12.4bpp.lz \
  graphics/opanim/opanim13.4bpp.lz \
  graphics/opanim/opanim14.4bpp.lz \
  graphics/opanim/opanim15.4bpp.lz \
  graphics/opanim/opanim16.4bpp.lz \
  graphics/opanim/opanim17.4bpp.lz \
  graphics/opanim/opanim18.4bpp.lz \
  graphics/opanim/opanim19.4bpp.lz \
  graphics/opanim/opanim2.4bpp.lz \
  graphics/opanim/opanim20.4bpp.lz \
  graphics/opanim/opanim21.4bpp.lz \
  graphics/opanim/opanim22.4bpp.lz \
  graphics/opanim/opanim23.4bpp.lz \
  graphics/opanim/opanim24.4bpp.lz \
  graphics/opanim/opanim25.4bpp.lz \
  graphics/opanim/opanim26.4bpp.lz \
  graphics/opanim/opanim27.4bpp.lz \
  graphics/opanim/opanim28.4bpp.lz \
  graphics/opanim/opanim29.4bpp.lz \
  graphics/opanim/opanim3.4bpp.lz \
  graphics/opanim/opanim30.4bpp.lz \
  graphics/opanim/opanim31.4bpp.lz \
  graphics/opanim/opanim32.4bpp.lz \
  graphics/opanim/opanim33.4bpp.lz \
  graphics/opanim/opanim34.4bpp.lz \
  graphics/opanim/opanim35.4bpp.lz \
  graphics/opanim/opanim36.4bpp.lz \
  graphics/opanim/opanim37.4bpp.lz \
  graphics/opanim/opanim38.4bpp.lz \
  graphics/opanim/opanim39.4bpp.lz \
  graphics/opanim/opanim4.4bpp.lz \
  graphics/opanim/opanim40.4bpp.lz \
  graphics/opanim/opanim41.4bpp.lz \
  graphics/opanim/opanim42.4bpp.lz \
  graphics/opanim/opanim43.4bpp.lz \
  graphics/opanim/opanim44.4bpp.lz \
  graphics/opanim/opanim45.4bpp.lz \
  graphics/opanim/opanim46.4bpp.lz \
  graphics/opanim/opanim47.4bpp.lz \
  graphics/opanim/opanim48.4bpp.lz \
  graphics/opanim/opanim49.4bpp.lz \
  graphics/opanim/opanim5.4bpp.lz \
  graphics/opanim/opanim50.4bpp.lz \
  graphics/opanim/opanim51.4bpp.lz \
  graphics/opanim/opanim52.4bpp.lz \
  graphics/opanim/opanim53.4bpp.lz \
  graphics/opanim/opanim54.4bpp.lz \
  graphics/opanim/opanim55.4bpp.lz \
  graphics/opanim/opanim56.4bpp.lz \
  graphics/opanim/opanim57.4bpp.lz \
  graphics/opanim/opanim58.4bpp.lz \
  graphics/opanim/opanim59.4bpp.lz \
  graphics/opanim/opanim6.4bpp.lz \
  graphics/opanim/opanim60.4bpp.lz \
  graphics/opanim/opanim61.4bpp.lz \
  graphics/opanim/opanim62.4bpp.lz \
  graphics/opanim/opanim63.4bpp.lz \
  graphics/opanim/opanim64.4bpp.lz \
  graphics/opanim/opanim65.4bpp.lz \
  graphics/opanim/opanim66.4bpp.lz \
  graphics/opanim/opanim67.4bpp.lz \
  graphics/opanim/opanim68.4bpp.lz \
  graphics/opanim/opanim69.4bpp.lz \
  graphics/opanim/opanim7.4bpp.lz \
  graphics/opanim/opanim70.4bpp.lz \
  graphics/opanim/opanim71.4bpp.lz \
  graphics/opanim/opanim72.4bpp.lz \
  graphics/opanim/opanim73.4bpp.lz \
  graphics/opanim/opanim74.4bpp.lz \
  graphics/opanim/opanim75.4bpp.lz \
  graphics/opanim/opanim76.4bpp.lz \
  graphics/opanim/opanim77.4bpp.lz \
  graphics/opanim/opanim78.4bpp.lz \
  graphics/opanim/opanim79.4bpp.lz \
  graphics/opanim/opanim8.4bpp.lz \
  graphics/opanim/opanim80.4bpp.lz \
  graphics/opanim/opanim81.4bpp.lz \
  graphics/opanim/opanim82.4bpp.lz \
  graphics/opanim/opanim83.4bpp.lz \
  graphics/opanim/opanim84.4bpp.lz \
  graphics/opanim/opanim85.4bpp.lz \
  graphics/opanim/opanim86.4bpp.lz \
  graphics/opanim/opanim87.4bpp.lz \
  graphics/opanim/opanim88.4bpp.lz \
  graphics/opanim/opanim89.4bpp.lz \
  graphics/opanim/opanim9.4bpp.lz \
  graphics/opanim/opanim90.4bpp.lz \
  graphics/opanim/opanim91.4bpp.lz \
  graphics/opanim/opanim92.4bpp.lz \
  graphics/opanim/opanim93.4bpp.lz \
  graphics/opanim/opanim94.4bpp.lz \
  graphics/opanim/opanim95.4bpp.lz \
  graphics/opanim/opanim96.4bpp.lz \
  graphics/opanim/opanim97.4bpp.lz \
  graphics/opanim/opanim98.4bpp.lz \
  graphics/opanim/opanim99.4bpp.lz

asm/dat_data_opanim_gfx_p3.o: \
  graphics/opanim/OpAnimMyrrh.4bpp.lz \
  graphics/opanim/OpAnimMyrrh.map.bin.lz \
  graphics/opanim/OpAnimMyrrh2.4bpp.lz \
  graphics/opanim/OpAnimSeth.gbapal

asm/dat_data_opanim_gfx_p4.o: \
  graphics/opanim/OpAnimMyrrh.gbapal \
  graphics/opanim/OpAnimSaleh.4bpp.lz \
  graphics/opanim/OpAnimSaleh.map.bin.lz \
  graphics/opanim/OpAnimSaleh2.4bpp.lz

asm/dat_data_opanim_gfx_p5.o: \
  graphics/opanim/OpAnimSaleh.gbapal \
  graphics/opanim/OpAnimTethys.4bpp.lz \
  graphics/opanim/OpAnimTethys.map.bin.lz \
  graphics/opanim/OpAnimTethys2.4bpp.lz

asm/dat_data_opanim_gfx_p6.o: \
  graphics/opanim/08ADBE78.gbapal \
  graphics/opanim/OpAnimTethys.gbapal

asm/dat_data_opanim_gfx_p9.o: \
  graphics/opanim/OpAnimFaceDozla.gbapal \
  graphics/opanim/OpAnimFaceEwan.4bpp.lz \
  graphics/opanim/OpAnimFaceEwan.gbapal \
  graphics/opanim/OpAnimFaceEwanShadow.4bpp.lz \
  graphics/opanim/OpAnimFaceGerik.4bpp.lz \
  graphics/opanim/OpAnimFaceGerik.gbapal \
  graphics/opanim/OpAnimFaceGerikShadow.4bpp.lz \
  graphics/opanim/OpAnimFaceMarisa.4bpp.lz \
  graphics/opanim/OpAnimFaceMarisa.gbapal \
  graphics/opanim/OpAnimFaceMarisaShadow.4bpp.lz \
  graphics/opanim/OpAnimFaceTethys.4bpp.lz \
  graphics/opanim/OpAnimFaceTethys.gbapal \
  graphics/opanim/OpAnimFaceTethysShadow.4bpp.lz

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
