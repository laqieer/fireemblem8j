	.section .rodata.dat_gProcScr_TerrainHealDisplay_ref, "a", %progbits
@ gProcScr_TerrainHealDisplay: region-different data, JP 0x085c6830 read from funcmap-aligned code literal (US 0x0859e308); incbin baserom.gba
	.global gProcScr_TerrainHealDisplay
gProcScr_TerrainHealDisplay:
	.incbin "baserom.gba", 0x5C6830, 0x60
