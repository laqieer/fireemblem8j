	.section .rodata.dat_EventScr_Ch1Tut_GuideTerrainHeal_ref, "a", %progbits
@ EventScr_Ch1Tut_GuideTerrainHeal: region-different data, JP 0x08a61ee0 read from funcmap-aligned code literal (US 0x089efda8); incbin baserom.gba
	.global EventScr_Ch1Tut_GuideTerrainHeal
EventScr_Ch1Tut_GuideTerrainHeal:
	.incbin "baserom.gba", 0xA61EE0, 0x40
