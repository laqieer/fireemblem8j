	.section .rodata.dat_worldmap_gmapunit_p1542, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x08a601f8 (US 0x089ee0c0, shift -0xFFF8DEC8); incbin baserom.gba
	.global EventScr_CallOnTutorialMode
EventScr_CallOnTutorialMode:
	.incbin "data/residual/EventScr_CallOnTutorialMode.bin"
	.global EventScr_CallOnHardMode
EventScr_CallOnHardMode:
	.incbin "data/residual/EventScr_CallOnHardMode.bin"
	.global EventScr_CallOnChapterNumber
EventScr_CallOnChapterNumber:
	.incbin "data/residual/EventScr_CallOnChapterNumber.bin"
	.global EventScr_CallIfCommonMode
EventScr_CallIfCommonMode:
	.incbin "data/residual/EventScr_CallIfCommonMode.bin"
	.global EventScr_CallWithModeCheck
EventScr_CallWithModeCheck:
	.incbin "data/residual/EventScr_CallWithModeCheck.bin"
	.global EventScr_SetFlagIfPlayedThrough
EventScr_SetFlagIfPlayedThrough:
	.incbin "data/residual/EventScr_SetFlagIfPlayedThrough.bin"
