# frontier_ending_cg -- large UNCOMPRESSED CG blob (JP 0x08b27970, 80484 B).
# Uncompressed => any tile-aligned split is byte-exact. Split into editable
# sources for the provably-clean leading region; the rest is kept verbatim.
#
# Boundary proof (empirical, from the committed bytes):
#   P = 0x0080 : first 128 B are all bit15-clear BGR555 (4x16 = 64 colors); the
#               first bit15-set u16 is exactly at 0x80  -> palette end.
#   T = 0x8080 : bytes [0x80:0x8080] are dense high-entropy 4bpp pixels (1024
#               whole tiles); at 0x8080 the data becomes a TSA tilemap -- u16 with
#               strictly incrementing tile indices (33e0 13e1 13e2 13e3 ...).
#   [0x8080:0x13a64] is INTERSPERSED tiles + tilemap (3 more tilemap runs at
#               ~0xd8e2, ~0x1313c and the 0xf001-run tail). The intervening pixel
#               runs do NOT start/end on 32-B tile boundaries (spans 20574 B and
#               21258 B -- not multiples of 32), so there is no honest clean
#               tile-aligned cut; that region is retained as a verbatim .bin.
#
# Assets (see src/data/frontier_ending_cg/frontier_ending_cg.c INCBIN order):
#   frontier_ending_cg.pal            -> frontier_ending_cg.gbapal (%.gbapal:%.pal)   [0x00:0x80]
#   frontier_ending_cg.png            -> frontier_ending_cg.4bpp   (%.4bpp:%.png)     [0x80:0x8080]
#   frontier_ending_cg_tail_B2F9F0.bin (committed verbatim, incbin'd directly)       [0x8080:0x13a64]
#
# The generated .gbapal/.4bpp must be rebuilt from the committed .pal/.png before
# the object is compiled; scripts/gen_data_incbin_deps.py emits that .o dependency
# from the .c INCBIN paths. Oracle: make compare (and make clean && make compare).
