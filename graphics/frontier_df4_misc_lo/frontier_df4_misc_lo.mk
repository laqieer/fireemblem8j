# frontier_df4_misc_lo -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 -> committed decompressed .bin (gbagfx %.lz: % rebuilds it
# byte-identical at the pinned -mindist); raw palette -> JASC .pal; everything else ->
# verbatim .bin incbin'd directly. baserom.gba is out of the build graph. Oracle: make compare.


# wave49: frontier_df4_misc_lo_015's LZ builds from its decompressed .bin source;
# gbagfx pads to 4-byte alignment (444B), truncate to the JP length (442B).
graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_015_19E6EC.lz: graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_015_19E6EC.bin
	$(GBAGFX) $< $@
	truncate -s 442 $@

