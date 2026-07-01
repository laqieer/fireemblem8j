# frontier_df3_btl_bg -- region-DIFFERENT frontier battle-background graphics extracted
# FRESH from the JP ROM. The two LZ77 tile blobs are committed as editable .png sheets
# (gbagfx %.4bpp: %.png decodes them, %.lz: % recompresses at the default -mindist
# byte-identical to the ROM); the trailing raw tilemap stays a verbatim .bin incbin'd
# directly. baserom.gba is out of the build graph. Live deps are tracked in
# layout/data_incbin_deps.mk for src/data/frontier_df3_btl_bg/frontier_df3_btl_bg.o;
# this file documents the source assets. Oracle: make compare.
#
#   frontier_df3_btl_bg_000_7B40A8.png  ->  .4bpp -> .4bpp.lz  (16-tile-wide sheet)
#   frontier_df3_btl_bg_001_7B6E50.png  ->  .4bpp -> .4bpp.lz  (16-tile-wide sheet)
#   frontier_df3_btl_bg_002_7B83B8.bin  ->  verbatim (tilemap)

# --- mindist pins (pixel-gfx sheets) ---
graphics/frontier_df3_btl_bg/data_087B9CDC.map.bin.lz: LZ_FLAGS := -mindist 1
