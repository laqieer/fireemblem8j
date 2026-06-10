	.section .rodata.dat_data_5AA96C_p1, "a", %progbits
@ src/data/data_5AA96C.o: region-same content at JP 0x085d68b4 (US 0x085ac604, shift -0xFFFD5D50); incbin baserom.gba
	.global gUnkData_6
gUnkData_6:
	.incbin "baserom.gba", 0x5D68B4, 0x3D8
	.global Img_LinkArenaRankIcons
Img_LinkArenaRankIcons:
	.incbin "graphics/misc_gfx2/Img_LinkArenaRankIcons.bin.lz"
	.global Img_LinkArenaActiveBannerFx
Img_LinkArenaActiveBannerFx:
	.incbin "graphics/misc_gfx2/Img_LinkArenaActiveBannerFx.bin.lz"
	.global gUnkData_7
gUnkData_7:
	.incbin "baserom.gba", 0x5D71AC, 0x1D0
