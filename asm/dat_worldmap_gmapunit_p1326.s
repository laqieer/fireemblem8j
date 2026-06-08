	.section .rodata.dat_worldmap_gmapunit_p1326, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x0890a730 (US 0x088b61a8, shift -0xFFFABA78); incbin baserom.gba
	.global UnitDef_Ch6Mixed
UnitDef_Ch6Mixed:
	.incbin "baserom.gba", 0x90A730, 0x230
	.global UnitDef_Event_Ch6Ally
UnitDef_Event_Ch6Ally:
	.incbin "baserom.gba", 0x90A960, 0xDC
