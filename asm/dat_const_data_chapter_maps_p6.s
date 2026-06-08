	.section .rodata.dat_const_data_chapter_maps_p6, "a", %progbits
@ src/data/const_data_chapter_maps.o: region-same content at JP 0x0819ebdc (US 0x081af220, shift -0x10644); incbin baserom.gba
	.global SomeBuildingMap
SomeBuildingMap:
	.incbin "baserom.gba", 0x19EBDC, 0x100
	.global SomePathMap
SomePathMap:
	.incbin "baserom.gba", 0x19ECDC, 0x114
	.global RenaisShrineMap
RenaisShrineMap:
	.incbin "baserom.gba", 0x19EDF0, 0xE8
	.global GradoShrineMapPast
GradoShrineMapPast:
	.incbin "baserom.gba", 0x19EED8, 0xE8
	.global GradoPrisonMap
GradoPrisonMap:
	.incbin "baserom.gba", 0x19EFC0, 0x1AC
	.global GradoBordersMap
GradoBordersMap:
	.incbin "baserom.gba", 0x19F16C, 0xFC
	.global RenvalGateMap
RenvalGateMap:
	.incbin "baserom.gba", 0x19F268, 0xD4
	.global RenaisAudienceMap
RenaisAudienceMap:
	.incbin "baserom.gba", 0x19F33C, 0xAC
	.global RenaisThroneMap
RenaisThroneMap:
	.incbin "baserom.gba", 0x19F3E8, 0x11C
	.global CaerPelynMap
CaerPelynMap:
	.incbin "baserom.gba", 0x19F504, 0x12C
	.global RenaisCastleMap
RenaisCastleMap:
	.incbin "baserom.gba", 0x19F630, 0x13C
	.global GradoCastleMap
GradoCastleMap:
	.incbin "baserom.gba", 0x19F76C, 0x148
	.global Ch11EphraimMap
Ch11EphraimMap:
	.incbin "baserom.gba", 0x19F8B4, 0x114
	.global Ch11EirikaMap
Ch11EirikaMap:
	.incbin "baserom.gba", 0x19F9C8, 0x230
	.global DebugMap
DebugMap:
	.incbin "baserom.gba", 0x19FBF8, 0x34
	.global AnInterestingMap
AnInterestingMap:
	.incbin "baserom.gba", 0x19FC2C, 0x54
	.global LinkArenaMap
LinkArenaMap:
	.incbin "baserom.gba", 0x19FC80, 0x108
	.global MelkaenCoastMap
MelkaenCoastMap:
	.incbin "baserom.gba", 0x19FD88, 0x340
