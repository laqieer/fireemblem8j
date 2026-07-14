# graphics/misc_gfx2 -- long-tail graphics blobs carved from mixed data providers
# (UI / ending staff-reel / worldmap gmap+minimap+skirmish / trap & particle FX /
# op-subtitle / level-up / save-menu bg / address-named data files). LZ77 ->
# DECOMPRESSED .bin (%.lz: % gbagfx); palette -> .pal (-> .gbapal); bit-15-set /
# verbatim -> .bin direct.

src/data/const_data/const_data_DB034.o: \
  graphics/misc_gfx2/Img_ConstDataDB034_0.4bpp.lz \
  graphics/misc_gfx2/Img_ConstDataDB034_1.4bpp.lz \
  graphics/misc_gfx2/Img_ConstDataDB034_2.4bpp.lz \
  graphics/misc_gfx2/Img_ConstDataDB034_3.4bpp.lz \
  graphics/misc_gfx2/Img_ConstDataDB034_4.4bpp.lz \
  graphics/misc_gfx2/Pal_NewEkrBaseKaiten.gbapal



















src/data/op_subtitle/op_subtitle_gfx.o: \
  graphics/misc_gfx2/gGfx_OpSubtitle_02.4bpp.lz

src/data/op_subtitle/op_subtitle_gfx.o: \
  graphics/misc_gfx2/gGfx_OpSubtitle_03.4bpp.lz

src/data/op_subtitle/op_subtitle_gfx.o: \
  graphics/misc_gfx2/gGfx_OpSubtitle_04.4bpp.lz

src/data/op_subtitle/op_subtitle_gfx.o: \
  graphics/misc_gfx2/gGfx_OpSubtitle_06.4bpp.lz

src/data/op_subtitle/op_subtitle_gfx.o: \
  graphics/misc_gfx2/gTsa_OpSubtitle_06.tsa.bin.lz








# soil-pilot: gWorldmapGmap_3, Img_GmapNodes, Img_GmapCastleNodes need mindist=2
# for the LZ recompressor to produce byte-identical output.
graphics/misc_gfx2/gWorldmapGmap_3.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/misc_gfx2/Img_GmapNodes.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/misc_gfx2/Img_GmapCastleNodes.4bpp.lz: LZ_FLAGS := -mindist 2

# issue140: gTsa_WorldmapMinimap_1 (LZ-compressed TSA) requires mindist=2 to
# reproduce byte-identical output vs the JP ROM.
graphics/misc_gfx2/gTsa_WorldmapMinimap_1.bin.lz: LZ_FLAGS := -mindist 2

# issue143-ending-providers: gTsa_OpSubtitle_06 must use mindist=2 to
# reproduce the 176-byte JP LZ stream exactly.
graphics/misc_gfx2/gTsa_OpSubtitle_06.tsa.bin.lz: LZ_FLAGS := -mindist 2

# issue #143 (ending-assets): dat_worldmap_minimap_p0 expanded backward to
# 0x08B1D954; both new LZ sheets need mindist=2 to reproduce the JP bytes.
graphics/misc_gfx2/gUnk_08B1D954.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/misc_gfx2/gWorldmapMinimap_0.4bpp.lz: LZ_FLAGS := -mindist 2

# issue #143 (ending-assets): dat_worldmap_skirmish expanded forward through
# 0x08B2759C; both new LZ sheets need mindist=2 to reproduce the JP bytes.
graphics/misc_gfx2/Img_WorldmapMinimap.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/misc_gfx2/gImg_WorldmapSkirmish.4bpp.lz: LZ_FLAGS := -mindist 2

# soil-pilot: typed C object replaced the former worldmap-gmap assembly provider.
# It depends on 4 PNG-derived 4bpp files + 2 PNG-derived 4bpp.lz files.
src/data/worldmap/worldmap_gmap.o: \
  graphics/misc_gfx2/gWorldmapGmap_0.4bpp \
  graphics/misc_gfx2/gWorldmapGmap_1.4bpp \
  graphics/misc_gfx2/gWorldmapGmap_2.4bpp \
  graphics/misc_gfx2/gWorldmapGmap_3.4bpp.lz \
  graphics/misc_gfx2/Img_GmapNodes.4bpp.lz \
  graphics/misc_gfx2/Img_GmapCastleNodes.4bpp.lz






# wave49: gTsa_OpSubtitle_05 (JP-LZ tilemap) builds from its decompressed .bin
# source. gbagfx reproduces the exact JP bytes except a trailing 4-byte-alignment
# pad (380B vs JP 379B), so truncate the built .lz to the JP length.
graphics/misc_gfx2/gTsa_OpSubtitle_05.bin.lz: graphics/misc_gfx2/gTsa_OpSubtitle_05.bin
	$(GBAGFX) $< $@
	truncate -s 379 $@
