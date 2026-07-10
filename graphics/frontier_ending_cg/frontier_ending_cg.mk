# frontier_ending_cg -- large UNCOMPRESSED CG blob (JP 0x08b27970, 80484 B).
# Uncompressed => ANY tile-aligned split is byte-exact (oracle: make compare).
#
# The 47588 B tail [blob 0x08080:0x13a64] was once kept fully verbatim as
# frontier_ending_cg_tail_B2F9F0.bin ("interspersed tiles+tilemap, no clean cut").
# RE-DERIVED: the prior pixel spans were non-32-aligned only because they were
# measured INCLUDING the following tilemap. Locating each TSA map first (u16
# tile-attrs, header = (w-1)|((h-1)<<8), then w*h entries + a trailing 0x0000 pad)
# makes the pixel runs fall on whole-tile boundaries:
#
#   blob-off        size   tiles  what                       asset
#   0x08080:0x08884 2052B   --    TSA 32x32  hdr 0x1f1f       map0.tsa.bin
#   0x08884:0x0d964 20704B  647   4bpp tile sheet            sheet1.png -> .4bpp
#   0x0d964:0x0d97c 24B      --    0x01f0/0xf001 filler pad   pad_B352D4.bin (verbatim)
#   0x0d97c:0x0de30 1204B    --    TSA 30x20  hdr 0x131d      map1.tsa.bin
#   0x0de30:0x131d0 21408B  669   4bpp tile sheet            sheet2.png -> .4bpp
#   0x131d0:0x13684 1204B    --    TSA 30x20  hdr 0x131d      map2.tsa.bin
#   0x13684:0x13a64 992B     --    mixed 4bpp + sparse data   tail_B3AFF4.bin (verbatim)
#
# sheet2 is EXACTLY 669 tiles (21408 = 669*32) -- a clean cut the prior verdict
# missed. sheet1 is 647 whole tiles + a 24 B 0x01f0 filler tail (0.75 tile), kept
# verbatim. The final 992 B is genuinely mixed (pixel-like tiles interleaved with
# sparse u16 records; no incrementing tilemap, no 16-colour palette block), so it
# stays a named verbatim .bin. TSA maps stay binary but NAMED .tsa.bin (fe8u keeps
# cg_N.tsa.bin binary too, same 1204-B layout).
#
# Assets (see src/data/frontier_ending_cg/frontier_ending_cg.c INCBIN order):
#   frontier_ending_cg.pal              -> .gbapal  (%.gbapal:%.pal)   [0x00000:0x00080]
#   frontier_ending_cg.png              -> .4bpp    (%.4bpp:%.png)     [0x00080:0x08080]
#   frontier_ending_cg_map0.tsa.bin     (verbatim, incbin'd directly)  [0x08080:0x08884]
#   frontier_ending_cg_sheet1.png       -> .4bpp    (%.4bpp:%.png)     [0x08884:0x0d964]
#   frontier_ending_cg_pad_B352D4.bin   (verbatim, incbin'd directly)  [0x0d964:0x0d97c]
#   frontier_ending_cg_map1.tsa.bin     (verbatim, incbin'd directly)  [0x0d97c:0x0de30]
#   frontier_ending_cg_sheet2.png       -> .4bpp    (%.4bpp:%.png)     [0x0de30:0x131d0]
#   frontier_ending_cg_map2.tsa.bin     (verbatim, incbin'd directly)  [0x131d0:0x13684]
#   frontier_ending_cg_tail_B3AFF4.bin  (verbatim, incbin'd directly)  [0x13684:0x13a64]
#
# The generated .gbapal/.4bpp are rebuilt from the committed .pal/.png before the
# object compiles; scripts/gen_data_incbin_deps.py emits that .o dependency from
# the .c INCBIN paths. Oracle: make compare (and make clean && make compare).
