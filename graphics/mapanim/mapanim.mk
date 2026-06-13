# graphics/mapanim -- per-subsystem asset wiring (parallel-safe pin mechanism).
# Auto-included by the root Makefile via `-include $(GRAPHICS_MK)`. See
# graphics/misc/misc.mk for the convention.
#
# The map-animation graphics across three objects:
#   dat_mapanim_eventcall.s      -- 290 assets: map-event-call cut-in images
#     (91 .4bpp.lz LZ + 91 .4bpp uncompressed) and 108 .tsa.bin.lz tilemaps.
#   dat_data_map_anim_frames.s   -- 118 assets: animated map-tile frames
#     (78 .4bpp tile frames + 40 palettes; 4 are JP-specific .gbapal binaries).
#   dat_anim_mapanim_objects.s   -- 6 graphics assets (Arena building front,
#     MISS/NODAMAGE pop-ups, Manakete-Mu palette); the remaining 165 symbols are
#     anim-object data structs (frame/anim lists, OAM) -- NOT graphics, left as incbin.
# Region-SAME with US (graphics/misc, graphics/map). The 4 JP-specific .gbapal in
# dat_data_map_anim_frames are committed verbatim (the JP ROM packs extra trailing
# color/padding beyond the US .pal), so they incbin directly with no build step.
#
# -mindist: the LZ assets below need mindist 1 (1/2/3 sweep); the rest use default 2.

src/data/mapanim/mapanim_eventcall.o: \
  graphics/mapanim/Tsa_Mapeventcall_0.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_1.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_10.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_11.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_12.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_13.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_14.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_15.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_16.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_17.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_2.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_3.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_4.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_5.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_6.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_7.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_8.tsa.bin.lz \
  graphics/mapanim/Tsa_Mapeventcall_9.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_135.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_136.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_137.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_138.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_139.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_140.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_141.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_142.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_143.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_144.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_145.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_146.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_147.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_148.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_149.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_150.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_151.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_152.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_153.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_154.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_155.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_156.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_157.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_158.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_159.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_160.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_161.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_162.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_163.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_164.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_165.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_166.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_167.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_168.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_169.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_170.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_171.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_172.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_173.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_174.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_175.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_176.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_177.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_178.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_179.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_180.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_181.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_182.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_183.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_184.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_185.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_186.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_187.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_188.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_189.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_190.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_207.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_208.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_209.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_210.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_211.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_212.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_213.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_214.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_267.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_268.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_269.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_270.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_271.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_272.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_273.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_274.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_275.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_276.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_277.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_278.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_279.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_280.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_281.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_282.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_283.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_284.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_285.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_286.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_287.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_288.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_289.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_290.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_291.tsa.bin.lz \
  graphics/mapanim/gMapanimEventcall_292.tsa.bin.lz \
  graphics/mapanim/gUnknown_089B83C0.4bpp.lz \
  graphics/mapanim/gUnknown_089B89C4.4bpp.lz \
  graphics/mapanim/gUnknown_089B90D8.4bpp.lz \
  graphics/mapanim/gUnknown_089B98DC.4bpp.lz \
  graphics/mapanim/gUnknown_089BA190.4bpp.lz \
  graphics/mapanim/gUnknown_089BA9D8.4bpp.lz \
  graphics/mapanim/gUnknown_089BB2C8.4bpp.lz \
  graphics/mapanim/gUnknown_089BBD68.4bpp.lz \
  graphics/mapanim/gUnknown_089BC884.4bpp.lz \
  graphics/mapanim/gUnknown_089BD3B4.4bpp.lz \
  graphics/mapanim/gUnknown_089BDEE8.4bpp.lz \
  graphics/mapanim/gUnknown_089BEA90.4bpp.lz \
  graphics/mapanim/gUnknown_089BF5FC.4bpp.lz \
  graphics/mapanim/gUnknown_089BFF64.4bpp.lz \
  graphics/mapanim/gUnknown_089C08C0.4bpp.lz \
  graphics/mapanim/gUnknown_089C1190.4bpp.lz \
  graphics/mapanim/gUnknown_089C1BA8.4bpp.lz \
  graphics/mapanim/gUnknown_089C247C.4bpp.lz \
  graphics/mapanim/gUnknown_089C2BF0.4bpp.lz \
  graphics/mapanim/gUnknown_089C32A4.4bpp.lz \
  graphics/mapanim/gUnknown_089C39A8.4bpp.lz \
  graphics/mapanim/gUnknown_089C3EE8.4bpp.lz \
  graphics/mapanim/gUnknown_089C447C.4bpp.lz \
  graphics/mapanim/gUnknown_089C4834.4bpp.lz \
  graphics/mapanim/gUnknown_089C48E0.4bpp.lz \
  graphics/mapanim/gUnknown_089C495C.4bpp.lz \
  graphics/mapanim/gUnknown_089C49CC.4bpp.lz \
  graphics/mapanim/gUnknown_089C4E38.4bpp.lz \
  graphics/mapanim/gUnknown_089C5328.4bpp.lz \
  graphics/mapanim/gUnknown_089C5674.4bpp.lz \
  graphics/mapanim/gUnknown_089C5734.4bpp.lz \
  graphics/mapanim/gUnknown_089C57D8.4bpp.lz \
  graphics/mapanim/gUnknown_089C5F70.4bpp.lz \
  graphics/mapanim/gUnknown_089C65EC.4bpp.lz \
  graphics/mapanim/gUnknown_089C6A58.4bpp.lz \
  graphics/mapanim/gUnknown_089C6B20.4bpp.lz \
  graphics/mapanim/gUnknown_089C727C.4bpp.lz \
  graphics/mapanim/gUnknown_089C7A2C.4bpp.lz \
  graphics/mapanim/gUnknown_089C8440.4bpp.lz \
  graphics/mapanim/gUnknown_089C8DC4.4bpp.lz \
  graphics/mapanim/gUnknown_089C9A44.4bpp.lz \
  graphics/mapanim/gUnknown_089CA444.4bpp.lz \
  graphics/mapanim/gUnknown_089CAA10.4bpp.lz \
  graphics/mapanim/gUnknown_089CB7B0.4bpp.lz \
  graphics/mapanim/gUnknown_089CCA28.4bpp.lz \
  graphics/mapanim/gUnknown_089CCE8C.4bpp.lz \
  graphics/mapanim/gUnknown_089CD650.4bpp.lz \
  graphics/mapanim/gUnknown_089CE038.4bpp.lz \
  graphics/mapanim/gUnknown_089CEB94.4bpp.lz \
  graphics/mapanim/gUnknown_089CF7C0.4bpp.lz \
  graphics/mapanim/gUnknown_089D038C.4bpp.lz \
  graphics/mapanim/gUnknown_089D0E08.4bpp.lz \
  graphics/mapanim/gUnknown_089D1648.4bpp.lz \
  graphics/mapanim/gUnknown_089D1CA4.4bpp.lz \
  graphics/mapanim/gUnknown_089D20E0.4bpp.lz \
  graphics/mapanim/gUnknown_089D230C.4bpp.lz \
  graphics/mapanim/gUnknown_089D23D8.4bpp \
  graphics/mapanim/gUnknown_089D23F8.4bpp \
  graphics/mapanim/gUnknown_089D2418.4bpp \
  graphics/mapanim/gUnknown_089D2438.4bpp \
  graphics/mapanim/gUnknown_089D2458.4bpp \
  graphics/mapanim/gUnknown_089D2478.4bpp \
  graphics/mapanim/gUnknown_089D2498.4bpp \
  graphics/mapanim/gUnknown_089D24B8.4bpp \
  graphics/mapanim/gUnknown_089D24D8.4bpp \
  graphics/mapanim/gUnknown_089D24F8.4bpp \
  graphics/mapanim/gUnknown_089D2518.4bpp \
  graphics/mapanim/gUnknown_089D2538.4bpp \
  graphics/mapanim/gUnknown_089D2558.4bpp \
  graphics/mapanim/gUnknown_089D2578.4bpp \
  graphics/mapanim/gUnknown_089D2598.4bpp \
  graphics/mapanim/gUnknown_089D25B8.4bpp \
  graphics/mapanim/gUnknown_089D25D8.4bpp \
  graphics/mapanim/gUnknown_089D25F8.4bpp \
  graphics/mapanim/gUnknown_089D2618.4bpp \
  graphics/mapanim/gUnknown_089D2638.4bpp \
  graphics/mapanim/gUnknown_089D2658.4bpp \
  graphics/mapanim/gUnknown_089D2678.4bpp \
  graphics/mapanim/gUnknown_089D2698.4bpp \
  graphics/mapanim/gUnknown_089D26B8.4bpp \
  graphics/mapanim/gUnknown_089D26D8.4bpp \
  graphics/mapanim/gUnknown_089D26F8.4bpp \
  graphics/mapanim/gUnknown_089D2718.4bpp \
  graphics/mapanim/gUnknown_089D2738.4bpp \
  graphics/mapanim/gUnknown_089D2758.4bpp \
  graphics/mapanim/gUnknown_089D2778.4bpp \
  graphics/mapanim/gUnknown_089D2798.4bpp \
  graphics/mapanim/gUnknown_089D27B8.4bpp \
  graphics/mapanim/gUnknown_089D27D8.4bpp \
  graphics/mapanim/gUnknown_089D27F8.4bpp \
  graphics/mapanim/gUnknown_089D2818.4bpp \
  graphics/mapanim/gUnknown_089D2838.4bpp \
  graphics/mapanim/gUnknown_089D2858.4bpp \
  graphics/mapanim/gUnknown_089D2878.4bpp \
  graphics/mapanim/gUnknown_089D2898.4bpp \
  graphics/mapanim/gUnknown_089D28B8.4bpp \
  graphics/mapanim/gUnknown_089D28D8.4bpp \
  graphics/mapanim/gUnknown_089D28F8.4bpp \
  graphics/mapanim/gUnknown_089D2918.4bpp \
  graphics/mapanim/gUnknown_089D2938.4bpp \
  graphics/mapanim/gUnknown_089D2958.4bpp \
  graphics/mapanim/gUnknown_089D2978.4bpp \
  graphics/mapanim/gUnknown_089D2998.4bpp \
  graphics/mapanim/gUnknown_089D29B8.4bpp \
  graphics/mapanim/gUnknown_089D29D8.4bpp \
  graphics/mapanim/gUnknown_089D29F8.4bpp \
  graphics/mapanim/gUnknown_089D2A18.4bpp \
  graphics/mapanim/gUnknown_089D2A38.4bpp \
  graphics/mapanim/gUnknown_089D2A58.4bpp \
  graphics/mapanim/gUnknown_089D2A78.4bpp \
  graphics/mapanim/gUnknown_089D2A98.4bpp \
  graphics/mapanim/gUnknown_089D2AB8.4bpp \
  graphics/mapanim/gUnknown_089D8010.4bpp.lz \
  graphics/mapanim/gUnknown_089D8198.4bpp.lz \
  graphics/mapanim/gUnknown_089D84A8.4bpp.lz \
  graphics/mapanim/gUnknown_089D8910.4bpp.lz \
  graphics/mapanim/gUnknown_089D925C.4bpp.lz \
  graphics/mapanim/gUnknown_089DA40C.4bpp.lz \
  graphics/mapanim/gUnknown_089DB1A0.4bpp.lz \
  graphics/mapanim/gUnknown_089DBFE0.4bpp.lz \
  graphics/mapanim/gUnknown_089DCD48.4bpp \
  graphics/mapanim/gUnknown_089DCD68.4bpp \
  graphics/mapanim/gUnknown_089DCD88.4bpp \
  graphics/mapanim/gUnknown_089DCDA8.4bpp \
  graphics/mapanim/gUnknown_089DCDC8.4bpp \
  graphics/mapanim/gUnknown_089DCDE8.4bpp \
  graphics/mapanim/gUnknown_089DCE08.4bpp \
  graphics/mapanim/gUnknown_089DCE28.4bpp \
  graphics/mapanim/gUnknown_089DDE8C.4bpp.lz \
  graphics/mapanim/gUnknown_089DDF10.4bpp.lz \
  graphics/mapanim/gUnknown_089DDF9C.4bpp.lz \
  graphics/mapanim/gUnknown_089DE030.4bpp.lz \
  graphics/mapanim/gUnknown_089DE0BC.4bpp.lz \
  graphics/mapanim/gUnknown_089DE14C.4bpp.lz \
  graphics/mapanim/gUnknown_089DE1CC.4bpp.lz \
  graphics/mapanim/gUnknown_089DEA30.4bpp.lz \
  graphics/mapanim/gUnknown_089DF470.4bpp.lz \
  graphics/mapanim/gUnknown_089DFF90.4bpp.lz \
  graphics/mapanim/gUnknown_089E0AB8.4bpp.lz \
  graphics/mapanim/gUnknown_089E1480.4bpp.lz \
  graphics/mapanim/gUnknown_089E2154.4bpp.lz \
  graphics/mapanim/gUnknown_089E2C1C.4bpp.lz \
  graphics/mapanim/gUnknown_089E34A8.4bpp.lz \
  graphics/mapanim/gUnknown_089E3B88.4bpp.lz \
  graphics/mapanim/gUnknown_089E4024.4bpp.lz \
  graphics/mapanim/gUnknown_089E4344.4bpp.lz \
  graphics/mapanim/gUnknown_089E44B8.4bpp.lz \
  graphics/mapanim/gUnknown_089E45D0.4bpp.lz \
  graphics/mapanim/gUnknown_089E46E8.4bpp.lz \
  graphics/mapanim/gUnknown_089E47CC.4bpp.lz \
  graphics/mapanim/gUnknown_089E48C0.4bpp.lz \
  graphics/mapanim/gUnknown_089E49D8.4bpp.lz \
  graphics/mapanim/gUnknown_089E4AEC.4bpp.lz \
  graphics/mapanim/gUnknown_089E4BC8.4bpp.lz \
  graphics/mapanim/gUnknown_089E4C7C.4bpp \
  graphics/mapanim/gUnknown_089E4C9C.4bpp \
  graphics/mapanim/gUnknown_089E4CBC.4bpp \
  graphics/mapanim/gUnknown_089E4CDC.4bpp \
  graphics/mapanim/gUnknown_089E4CFC.4bpp \
  graphics/mapanim/gUnknown_089E4D1C.4bpp \
  graphics/mapanim/gUnknown_089E4D3C.4bpp \
  graphics/mapanim/gUnknown_089E4D5C.4bpp \
  graphics/mapanim/gUnknown_089E4D7C.4bpp \
  graphics/mapanim/gUnknown_089E4D9C.4bpp \
  graphics/mapanim/gUnknown_089E4DBC.4bpp \
  graphics/mapanim/gUnknown_089E4DDC.4bpp \
  graphics/mapanim/gUnknown_089E4DFC.4bpp \
  graphics/mapanim/gUnknown_089E4E1C.4bpp \
  graphics/mapanim/gUnknown_089E4E3C.4bpp \
  graphics/mapanim/gUnknown_089E4E5C.4bpp \
  graphics/mapanim/gUnknown_089E4E7C.4bpp \
  graphics/mapanim/gUnknown_089E4E9C.4bpp \
  graphics/mapanim/gUnknown_089E4EBC.4bpp \
  graphics/mapanim/gUnknown_089E4EDC.4bpp \
  graphics/mapanim/gUnknown_089E4EFC.4bpp \
  graphics/mapanim/gUnknown_089E4F1C.4bpp \
  graphics/mapanim/gUnknown_089E4F3C.4bpp \
  graphics/mapanim/gUnknown_089E4F5C.4bpp \
  graphics/mapanim/gUnknown_089E4F7C.4bpp \
  graphics/mapanim/gUnknown_089E4F9C.4bpp \
  graphics/mapanim/gUnknown_089E714C.4bpp.lz \
  graphics/mapanim/gUnknown_089E7DEC.4bpp

asm/dat_data_map_anim_frames.o: \
  graphics/mapanim/Ch11EphraimTileAnimations_frame_0.4bpp \
  graphics/mapanim/Ch11EphraimTileAnimations_frame_1.4bpp \
  graphics/mapanim/Ch11EphraimTileAnimations_frame_2.4bpp \
  graphics/mapanim/Ch11EphraimTileAnimations_frame_3.4bpp \
  graphics/mapanim/Ch11EphraimTileAnimations_frame_4.4bpp \
  graphics/mapanim/Ch11EphraimTileAnimations_frame_5.4bpp \
  graphics/mapanim/Ch11EphraimTileAnimations_frame_6.4bpp \
  graphics/mapanim/Ch11EphraimTileAnimations_frame_7.4bpp \
  graphics/mapanim/TileAnimations1_frame_0.4bpp \
  graphics/mapanim/TileAnimations1_frame_1.4bpp \
  graphics/mapanim/TileAnimations1_frame_10.4bpp \
  graphics/mapanim/TileAnimations1_frame_11.4bpp \
  graphics/mapanim/TileAnimations1_frame_12.4bpp \
  graphics/mapanim/TileAnimations1_frame_13.4bpp \
  graphics/mapanim/TileAnimations1_frame_14.4bpp \
  graphics/mapanim/TileAnimations1_frame_15.4bpp \
  graphics/mapanim/TileAnimations1_frame_2.4bpp \
  graphics/mapanim/TileAnimations1_frame_3.4bpp \
  graphics/mapanim/TileAnimations1_frame_4.4bpp \
  graphics/mapanim/TileAnimations1_frame_5.4bpp \
  graphics/mapanim/TileAnimations1_frame_6.4bpp \
  graphics/mapanim/TileAnimations1_frame_7.4bpp \
  graphics/mapanim/TileAnimations1_frame_8.4bpp \
  graphics/mapanim/TileAnimations1_frame_9.4bpp \
  graphics/mapanim/TileAnimations2_frame_0.4bpp \
  graphics/mapanim/TileAnimations2_frame_1.4bpp \
  graphics/mapanim/TileAnimations2_frame_10.4bpp \
  graphics/mapanim/TileAnimations2_frame_11.4bpp \
  graphics/mapanim/TileAnimations2_frame_12.4bpp \
  graphics/mapanim/TileAnimations2_frame_13.4bpp \
  graphics/mapanim/TileAnimations2_frame_14.4bpp \
  graphics/mapanim/TileAnimations2_frame_15.4bpp \
  graphics/mapanim/TileAnimations2_frame_2.4bpp \
  graphics/mapanim/TileAnimations2_frame_3.4bpp \
  graphics/mapanim/TileAnimations2_frame_4.4bpp \
  graphics/mapanim/TileAnimations2_frame_5.4bpp \
  graphics/mapanim/TileAnimations2_frame_6.4bpp \
  graphics/mapanim/TileAnimations2_frame_7.4bpp \
  graphics/mapanim/TileAnimations2_frame_8.4bpp \
  graphics/mapanim/TileAnimations2_frame_9.4bpp \
  graphics/mapanim/TileAnimations3_frame_0.4bpp \
  graphics/mapanim/TileAnimations3_frame_1.4bpp \
  graphics/mapanim/TileAnimations3_frame_2.4bpp \
  graphics/mapanim/TileAnimations3_frame_3.4bpp \
  graphics/mapanim/TileAnimations3_frame_4.4bpp \
  graphics/mapanim/TileAnimations3_frame_5.4bpp \
  graphics/mapanim/TileAnimations3_frame_6.4bpp \
  graphics/mapanim/TileAnimations3_frame_7.4bpp \
  graphics/mapanim/TileAnimations4_frame_0.gbapal \
  graphics/mapanim/TileAnimations4_frame_1.gbapal \
  graphics/mapanim/TileAnimations4_frame_10.gbapal \
  graphics/mapanim/TileAnimations4_frame_11.gbapal \
  graphics/mapanim/TileAnimations4_frame_12.gbapal \
  graphics/mapanim/TileAnimations4_frame_13.gbapal \
  graphics/mapanim/TileAnimations4_frame_14.gbapal \
  graphics/mapanim/TileAnimations4_frame_2.gbapal \
  graphics/mapanim/TileAnimations4_frame_3.gbapal \
  graphics/mapanim/TileAnimations4_frame_4.gbapal \
  graphics/mapanim/TileAnimations4_frame_5.gbapal \
  graphics/mapanim/TileAnimations4_frame_6.gbapal \
  graphics/mapanim/TileAnimations4_frame_7.gbapal \
  graphics/mapanim/TileAnimations4_frame_8.gbapal \
  graphics/mapanim/TileAnimations4_frame_9.gbapal \
  graphics/mapanim/TileAnimations5_frame_0.4bpp \
  graphics/mapanim/TileAnimations5_frame_1.4bpp \
  graphics/mapanim/TileAnimations5_frame_2.4bpp \
  graphics/mapanim/TileAnimations5_frame_3.4bpp \
  graphics/mapanim/TileAnimations5_frame_4.4bpp \
  graphics/mapanim/TileAnimations5_frame_5.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_0.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_1.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_10.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_11.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_12.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_13.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_14.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_15.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_2.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_3.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_4.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_5.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_6.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_7.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_8.4bpp \
  graphics/mapanim/TileAnimationsUnused1_frame_9.4bpp \
  graphics/mapanim/TileAnimationsUnused2_frame_0.4bpp \
  graphics/mapanim/TileAnimationsUnused2_frame_1.4bpp \
  graphics/mapanim/TileAnimationsUnused2_frame_2.4bpp \
  graphics/mapanim/TileAnimationsUnused2_frame_3.4bpp \
  graphics/mapanim/TileAnimationsUnused2_frame_4.4bpp \
  graphics/mapanim/TileAnimationsUnused2_frame_5.4bpp \
  graphics/mapanim/TileAnimationsUnused2_frame_6.4bpp \
  graphics/mapanim/TileAnimationsUnused2_frame_7.4bpp \
  graphics/mapanim/TileAnimationsUnused3_frame_0.gbapal \
  graphics/mapanim/TileAnimationsUnused3_frame_2.gbapal \
  graphics/mapanim/TileAnimationsUnused3_frame_3.gbapal \
  graphics/mapanim/TileAnimationsUnused3_frame_4.gbapal \
  graphics/mapanim/TileAnimationsUnused3_frame_5.gbapal \
  graphics/mapanim/TileAnimationsUnused3_frame_6.gbapal \
  graphics/mapanim/TileAnimationsUnused4_frame_0.gbapal \
  graphics/mapanim/TileAnimationsUnused4_frame_1.gbapal \
  graphics/mapanim/TileAnimationsUnused4_frame_10.gbapal \
  graphics/mapanim/TileAnimationsUnused4_frame_2.gbapal \
  graphics/mapanim/TileAnimationsUnused4_frame_3.gbapal \
  graphics/mapanim/TileAnimationsUnused4_frame_5.gbapal \
  graphics/mapanim/TileAnimationsUnused4_frame_6.gbapal \
  graphics/mapanim/TileAnimationsUnused4_frame_7.gbapal \
  graphics/mapanim/TileAnimationsUnused4_frame_8.gbapal \
  graphics/mapanim/TileAnimationsUnused5_frame_0.gbapal \
  graphics/mapanim/TileAnimationsUnused5_frame_1.gbapal \
  graphics/mapanim/TileAnimationsUnused5_frame_2.gbapal \
  graphics/mapanim/TileAnimationsUnused5_frame_3.gbapal \
  graphics/mapanim/TileAnimationsUnused5_frame_4.gbapal \
  graphics/mapanim/TileAnimationsUnused5_frame_5.gbapal

asm/dat_anim_mapanim_objects.o: \
  graphics/mapanim/Img_MapAnimMISS.4bpp.lz \
  graphics/mapanim/Img_MapAnimNODAMAGE.4bpp.lz \
  graphics/mapanim/Pal_MapAnimManaketeMu.gbapal \
  graphics/mapanim/gGfx_ArenaBuildingFront.4bpp.lz \
  graphics/mapanim/gPal_ArenaBuildingFront.gbapal

# --- mindist-1 pins ---
graphics/mapanim/gMapanimEventcall_135.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_136.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_137.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_138.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_139.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_140.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_141.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_142.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_143.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_144.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_145.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_146.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_147.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_148.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_149.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_150.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_151.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_152.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_153.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_154.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_155.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_156.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_157.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_158.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_159.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_160.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_161.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_162.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_163.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_164.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_165.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_166.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_167.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_168.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_169.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_170.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_171.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_172.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_173.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_174.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_175.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_176.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_177.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_178.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_179.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_180.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_181.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_182.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_183.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_184.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_185.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_186.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_187.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_188.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_189.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_190.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_207.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_208.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_209.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_210.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_211.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_214.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_267.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_268.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_269.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_270.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_271.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_272.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_273.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_274.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_275.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_276.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_277.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_278.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_279.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_280.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_281.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_282.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_283.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_284.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_285.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_286.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_287.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_288.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_289.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_290.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_291.tsa.bin.lz: LZ_FLAGS := -mindist 1
graphics/mapanim/gMapanimEventcall_292.tsa.bin.lz: LZ_FLAGS := -mindist 1
