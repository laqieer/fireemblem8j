	.section .rodata.dat_worldmap_gmapunit_p756, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085e4088 (US 0x085b9e58, shift -0xFFFD5DD0); incbin baserom.gba
	.global TsaConf_BanimTmA1
TsaConf_BanimTmA1:
	.incbin "baserom.gba", 0x5E4088, 0x98
	.global TsaConf_BanimTmA2
TsaConf_BanimTmA2:
	.incbin "baserom.gba", 0x5E4120, 0x98
	.global TsaConf_BanimTmA3
TsaConf_BanimTmA3:
	.incbin "baserom.gba", 0x5E41B8, 0x98
	.global TsaConf_BanimTmA4
TsaConf_BanimTmA4:
	.incbin "baserom.gba", 0x5E4250, 0x98
	.global Img_NODAMGEMIS
Img_NODAMGEMIS:
	.incbin "graphics/gmapunit/Img_NODAMGEMIS.bin.lz"
	.global Pal_Efxbattle_0
Pal_Efxbattle_0:
	.incbin "graphics/gmapunit/Pal_Efxbattle_0.gbapal"
	.global Pal_Efxbattle_1
Pal_Efxbattle_1:
	.incbin "graphics/gmapunit/Pal_Efxbattle_1.gbapal"
	.global Pal_Efxbattle_2
Pal_Efxbattle_2:
	.incbin "graphics/gmapunit/Pal_Efxbattle_2.gbapal"
