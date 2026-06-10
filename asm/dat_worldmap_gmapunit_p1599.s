	.section .rodata.dat_worldmap_gmapunit_p1599, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08a9651c (US 0x08a19ccc, shift -0xFFF837B0); incbin baserom.gba
	.global gUnkData_61
gUnkData_61:
	.incbin "baserom.gba", 0xA9651C, 0x3B8
	.global Pal_SpinningArrow
Pal_SpinningArrow:
	.incbin "graphics/gmapunit/Pal_SpinningArrow.gbapal"
	.global gUnkData_62
gUnkData_62:
	.incbin "baserom.gba", 0xA968F4, 0x198
	.global gUnkData_63
gUnkData_63:
	.incbin "baserom.gba", 0xA96A8C, 0x1C0
	.global gUnkData_64
gUnkData_64:
	.incbin "baserom.gba", 0xA96C4C, 0x20
	.global Tsa_UnkData_1
Tsa_UnkData_1:
	.incbin "graphics/gmapunit/Tsa_UnkData_1.bin"
	.global Tsa_UnkData_2
Tsa_UnkData_2:
	.incbin "graphics/gmapunit/Tsa_UnkData_2.bin"
	.global Tsa_UnkData_3
Tsa_UnkData_3:
	.incbin "graphics/gmapunit/Tsa_UnkData_3.bin"
