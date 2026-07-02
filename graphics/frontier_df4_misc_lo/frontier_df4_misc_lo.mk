# frontier_df4_misc_lo -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.

asm/frontier_df4_misc_lo.o: \
  graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_014a_0E8F58.4bpp.lz \
  graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_014b_0E9910.4bpp.lz \
  graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_014c_0EA2DC.4bpp.lz \
  graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_013a_0E7544.4bpp.lz \
  graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_013b_0E7F34.4bpp.lz \
  graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_016_1A4C88.bin.lz

# wave45 #6: frontier_df4_misc_lo_015's 442B LZ stream is NOT reproducible by
# gbagfx at any -mindist (JP encoder is 2B tighter: 442B vs gbagfx's best 444B),
# so the exact JP .lz bytes are COMMITTED (see .gitignore negation); this
# no-recipe rule stops the generic %.lz rule from trying to rebuild it.
graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_015_19E6EC.lz: ;

