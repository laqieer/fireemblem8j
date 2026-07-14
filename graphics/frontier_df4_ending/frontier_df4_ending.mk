# frontier_df4_ending -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 4bpp tile sheet -> editable .png (PNG -> .4bpp -> .4bpp.lz
# at -mindist 2 rebuilds the original compressed bytes); raw palette -> JASC .pal;
# everything else -> verbatim .bin incbin'd directly. baserom.gba is out of the build
# graph. Oracle: make compare.


# (009's and 014's sheets were migrated into dat_worldmap_minimap_p0 /
# dat_worldmap_skirmish respectively for issue #143; see
# graphics/misc_gfx2/misc_gfx2.mk for their mindist overrides.)


# wave49: frontier_df4_ending_006's two LZ sheets build from decompressed .bin
# sources; truncate gbagfx output to the exact JP lengths (508B; 548B incl. 3B pad).
graphics/frontier_df4_ending/frontier_df4_ending_006_AD02D4_0.bin.lz: graphics/frontier_df4_ending/frontier_df4_ending_006_AD02D4_0.bin
	$(GBAGFX) $< $@
	truncate -s 508 $@
graphics/frontier_df4_ending/frontier_df4_ending_006_AD02D4_1.bin.lz: graphics/frontier_df4_ending/frontier_df4_ending_006_AD02D4_1.bin
	$(GBAGFX) $< $@
	truncate -s 548 $@

# issue #143 (ending-assets): frontier_df4_ending_007's two independent LZ77
# streams (each decompressing to a 2050 B standard TSA, hdr 0x1f1f => 32x32).
# s0 round-trips exactly at -mindist 2. s1 round-trips its first 529 B exactly
# at -mindist 2 but gbagfx emits 3 extra trailing zero bytes (532 B total);
# truncate to the proven original length (decompression is unaffected, verified
# by re-decompressing the truncated stream and comparing to the source TSA).
graphics/frontier_df4_ending/frontier_df4_ending_007_s0.tsa.bin.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_ending/frontier_df4_ending_007_s1.tsa.bin.lz: graphics/frontier_df4_ending/frontier_df4_ending_007_s1.tsa.bin
	$(GBAGFX) $< $@ -mindist 2
	truncate -s 529 $@

