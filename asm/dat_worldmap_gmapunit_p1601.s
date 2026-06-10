	.section .rodata.dat_worldmap_gmapunit_p1601, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08a97c2c (US 0x08a1b194, shift -0xFFF83568); incbin baserom.gba
	.global AP_DrawPreparationsBanner
AP_DrawPreparationsBanner:
	.incbin "data/residual/AP_DrawPreparationsBanner.bin"
	.global Img_PrepFunds
Img_PrepFunds:
	.incbin "graphics/gmapunit/Img_PrepFunds.bin.lz"
