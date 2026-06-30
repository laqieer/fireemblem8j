# frontier_map_objtype -- region-DIFFERENT frontier map object-type graphics extracted
# FRESH from the JP ROM. The three LZ77 tile blobs are committed as editable .png sheets
# (gbagfx %.4bpp: %.png decodes them, %.lz: % recompresses at the default -mindist
# byte-identical to the ROM). baserom.gba is out of the build graph. Live deps are
# tracked in layout/data_incbin_deps.mk for
# src/data/frontier_map_objtype/frontier_map_objtype.o; this file documents the source
# assets. Oracle: make compare.
#
#   frontier_map_objtype_000_17B398.png  ->  .4bpp -> .4bpp.lz  (32-tile-wide sheet)
#   frontier_map_objtype_001_181610.png  ->  .4bpp -> .4bpp.lz  (32-tile-wide sheet)
#   frontier_map_objtype_002_188888.png  ->  .4bpp -> .4bpp.lz  (32-tile-wide sheet)
