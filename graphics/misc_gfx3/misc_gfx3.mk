# graphics/misc_gfx3 -- final long-tail graphics blobs (map-anim silence FX,
# worldmap highlight maps, stone-shatter anim, op-subtitle 00/01,
# IntelligentSystems logo, tri-pegasus BG). LZ77 -> .bin (%.lz: %); palette ->
# .pal (-> .gbapal); verbatim -> .bin direct. Generic src/data prerequisites are
# generated in layout/data_incbin_deps.mk.

src/data/op_subtitle/op_subtitle_gfx.o: \
  graphics/misc_gfx3/gGfx_OpSubtitle_00.4bpp.lz

src/data/op_subtitle/op_subtitle_gfx.o: \
  graphics/misc_gfx3/gGfx_OpSubtitle_01.4bpp.lz
