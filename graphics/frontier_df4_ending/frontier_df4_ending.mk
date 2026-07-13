# frontier_df4_ending -- region-DIFFERENT frontier data extracted FRESH from the JP ROM.
# Byte-typed per blob: LZ77 4bpp tile sheet -> editable .png (PNG -> .4bpp -> .4bpp.lz
# at -mindist 2 rebuilds the original compressed bytes); raw palette -> JASC .pal;
# everything else -> verbatim .bin incbin'd directly. baserom.gba is out of the build
# graph. Oracle: make compare.


# wave-reopened: 009/014 were mis-classified as non-reproducible LZ floors (an
# off-by-4-padding measurement error). Each is a GBA-BIOS-LZ77 sheet -> editable PNG
# whose png->.4bpp->.4bpp.lz at -mindist 2 reproduces the JP compressed bytes exactly;
# the trailing raw block stays verbatim. Sheet boundaries: 009 -> 0x490, 014 -> 0x6F0.
graphics/frontier_df4_ending/frontier_df4_ending_009_B1D954.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/frontier_df4_ending/frontier_df4_ending_014_B26A6C.4bpp.lz: LZ_FLAGS := -mindist 2

# wave49: frontier_df4_ending_006's two LZ sheets build from decompressed .bin
# sources; truncate gbagfx output to the exact JP lengths (508B; 548B incl. 3B pad).
graphics/frontier_df4_ending/frontier_df4_ending_006_AD02D4_0.bin.lz: graphics/frontier_df4_ending/frontier_df4_ending_006_AD02D4_0.bin
	$(GBAGFX) $< $@
	truncate -s 508 $@
graphics/frontier_df4_ending/frontier_df4_ending_006_AD02D4_1.bin.lz: graphics/frontier_df4_ending/frontier_df4_ending_006_AD02D4_1.bin
	$(GBAGFX) $< $@
	truncate -s 548 $@

