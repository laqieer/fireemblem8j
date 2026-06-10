	.section .rodata.dat_mapanim_levelup, "a", %progbits
	.align 2
@ src/data/mapanim/mapanim_levelup.o: region-same content at JP 0x08a1cc54 (US 0x089ac5cc, shift -0x-70688); incbin baserom.gba
	.global Pal_ManimLevelUpStatGainCycling
Pal_ManimLevelUpStatGainCycling:
	.incbin "graphics/misc_gfx2/Pal_ManimLevelUpStatGainCycling.gbapal"
	.global Img_ManimLevelUpText
Img_ManimLevelUpText:
	.incbin "graphics/misc_gfx2/Img_ManimLevelUpText.bin.lz"
	.global Pal_ManimLevelUp
Pal_ManimLevelUp:
	.incbin "graphics/misc_gfx2/Pal_ManimLevelUp.gbapal"
	.global Img_ManimLevelUpStatGain
Img_ManimLevelUpStatGain:
	.incbin "graphics/misc_gfx2/Img_ManimLevelUpStatGain.bin.lz"
	.global Img_ManimLevelUpStatGainDigits
Img_ManimLevelUpStatGainDigits:
	.incbin "graphics/misc_gfx2/Img_ManimLevelUpStatGainDigits.bin"
	.global gMapanimLevelup_0
gMapanimLevelup_0:
	.incbin "baserom.gba", 0xA1DB20, 0x68
