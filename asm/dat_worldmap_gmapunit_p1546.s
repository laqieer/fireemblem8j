	.section .rodata.dat_worldmap_gmapunit_p1546, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08a604b4 (US 0x089ee37c, shift -0xFFF8DEC8); incbin baserom.gba
	.global EventScr_ApplyTileChangeForFaction
EventScr_ApplyTileChangeForFaction:
	.incbin "baserom.gba", 0xA604B4, 0x20
	.global EventScr_FormatFlashingCursor
EventScr_FormatFlashingCursor:
	.incbin "baserom.gba", 0xA604D4, 0x20
	.global EventScr_MoveUnitS2ToLeader
EventScr_MoveUnitS2ToLeader:
	.incbin "baserom.gba", 0xA604F4, 0x38
	.global EventScr_FormatMoveUnit
EventScr_FormatMoveUnit:
	.incbin "baserom.gba", 0xA6052C, 0xAC
	.global EventScr_LoadUniqueAlly
EventScr_LoadUniqueAlly:
	.incbin "baserom.gba", 0xA605D8, 0x58
	.global EventScr_UnitWarpIN
EventScr_UnitWarpIN:
	.incbin "baserom.gba", 0xA60630, 0x24
	.global EventScr_UnitWarpOUT
EventScr_UnitWarpOUT:
	.incbin "baserom.gba", 0xA60654, 0x20
	.global EventScr_UnitFlushingIN
EventScr_UnitFlushingIN:
	.incbin "baserom.gba", 0xA60674, 0x3C
	.global EventScr_UnitFlushingOUT
EventScr_UnitFlushingOUT:
	.incbin "baserom.gba", 0xA606B0, 0x44
	.global EventScr_StrictLoadUniqueAlly
EventScr_StrictLoadUniqueAlly:
	.incbin "baserom.gba", 0xA606F4, 0x60
