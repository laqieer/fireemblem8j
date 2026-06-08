	.section .rodata.dat_mapanim_levelup, "a", %progbits
	.align 2
@ src/data/mapanim/mapanim_levelup.o: region-same content at JP 0x08a1cc54 (US 0x089ac5cc, shift -0x-70688); incbin baserom.gba
	.global Pal_ManimLevelUpStatGainCycling
Pal_ManimLevelUpStatGainCycling:
	.incbin "baserom.gba", 0xA1CC54, 0x1C8
	.global Img_ManimLevelUpText
Img_ManimLevelUpText:
	.incbin "baserom.gba", 0xA1CE1C, 0x214
	.global Pal_ManimLevelUp
Pal_ManimLevelUp:
	.incbin "baserom.gba", 0xA1D030, 0x60
	.global Img_ManimLevelUpStatGain
Img_ManimLevelUpStatGain:
	.incbin "baserom.gba", 0xA1D090, 0x290
	.global Img_ManimLevelUpStatGainDigits
Img_ManimLevelUpStatGainDigits:
	.incbin "baserom.gba", 0xA1D320, 0x800
	.global gMapanimLevelup_0
gMapanimLevelup_0:
	.incbin "baserom.gba", 0xA1DB20, 0x68
