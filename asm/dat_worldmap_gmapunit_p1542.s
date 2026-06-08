	.section .rodata.dat_worldmap_gmapunit_p1542, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08a601f8 (US 0x089ee0c0, shift -0xFFF8DEC8); incbin baserom.gba
	.global EventScr_CallOnTutorialMode
EventScr_CallOnTutorialMode:
	.incbin "baserom.gba", 0xA601F8, 0x1C
	.global EventScr_CallOnHardMode
EventScr_CallOnHardMode:
	.incbin "baserom.gba", 0xA60214, 0x28
	.global EventScr_CallOnChapterNumber
EventScr_CallOnChapterNumber:
	.incbin "baserom.gba", 0xA6023C, 0x1C
	.global EventScr_CallIfCommonMode
EventScr_CallIfCommonMode:
	.incbin "baserom.gba", 0xA60258, 0x20
	.global EventScr_CallWithModeCheck
EventScr_CallWithModeCheck:
	.incbin "baserom.gba", 0xA60278, 0x44
	.global EventScr_SetFlagIfPlayedThrough
EventScr_SetFlagIfPlayedThrough:
	.incbin "baserom.gba", 0xA602BC, 0x18
