# frontier_df3_banim_aura -- region-DIFFERENT aura battle-animation graphics
# (JP 0x087463dc..0x08763b10). LZ77 -> committed decompressed .bin (gbagfx %.lz: %);
# raw -> verbatim .bin. Fresh JP-ROM extraction. Oracle: make compare.

asm/frontier_df3_banim_aura.o: \
  graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_007a_758E68.4bpp.lz \
  graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_000a_7463DC.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_0874687C.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_08746D0C.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_087471A8.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_08747650.4bpp.lz \
  graphics/frontier_df3_banim_aura/data_08748B3C.4bpp.lz \
  graphics/frontier_df3_banim_aura/data_08749EE8.4bpp.lz \
  graphics/frontier_df3_banim_aura/data_0874B298.4bpp.lz \
  graphics/frontier_df3_banim_aura/data_0874C5B4.4bpp.lz \
  graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_003a_754840.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_087548F0.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_087549F8.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_08754B34.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_08754CA8.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_08754E40.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_08754FB4.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_087550C0.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_08755194.map.bin.lz \
  graphics/frontier_df3_banim_aura/data_08755234.4bpp.lz \
  graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_005a_756454.4bpp.lz \
  graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_006_756F38.4bpp.lz \
  graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_008_75CEFC.4bpp.lz



# --- mindist pins (hybrid JP-LZ sheets) ---

graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_003a_754840.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_aura/data_087548F0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_aura/data_087549F8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_aura/data_08754B34.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_aura/data_08754CA8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_aura/data_08754E40.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_aura/data_08754FB4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_aura/data_087550C0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_aura/data_08755194.map.bin.lz: LZ_FLAGS := -mindist 1

graphics/frontier_df3_banim_aura/frontier_df3_banim_aura_000a_7463DC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_aura/data_0874687C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_aura/data_08746D0C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/frontier_df3_banim_aura/data_087471A8.map.bin.lz: LZ_FLAGS := -mindist 1
