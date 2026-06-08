	.section .rodata.dat_const_data_chapter_maps_p0, "a", %progbits
@ src/data/const_data_chapter_maps.o: region-same content at JP 0x081504b8 (US 0x081609bc, shift -0x10504); incbin baserom.gba
	.global TowerOfValniObjectType
TowerOfValniObjectType:
	.incbin "baserom.gba", 0x1504B8, 0x55C0
	.global ObjectType10
ObjectType10:
	.incbin "baserom.gba", 0x155A78, 0x3DD8
