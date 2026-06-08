	.section .rodata.dat_worldmap_gmapunit_p702, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085c3b4c (US 0x0859b66c, shift -0xFFFD7B20); incbin baserom.gba
	.global gSomeSMSLookupTable_0
gSomeSMSLookupTable_0:
	.incbin "baserom.gba", 0x5C3B4C, 0x10
	.global sSlotToChrLut
sSlotToChrLut:
	.incbin "baserom.gba", 0x5C3B5C, 0xC0
	.global gBmudisp_0
gBmudisp_0:
	.incbin "baserom.gba", 0x5C3C1C, 0x80
