	.section .rodata.dat_worldmap_gmapunit_p1337, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x0890cf14 (US 0x088b898c, shift -0xFFFABA78); incbin baserom.gba
	.global UnitDef_Ch10ANPC
UnitDef_Ch10ANPC:
	.incbin "baserom.gba", 0x90CF14, 0x50
	.global UnitDef_Ch10AEnemy_2
UnitDef_Ch10AEnemy_2:
	.incbin "baserom.gba", 0x90CF64, 0x3C
