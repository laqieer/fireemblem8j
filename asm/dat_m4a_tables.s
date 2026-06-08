	.section .rodata.dat_m4a_tables, "a", %progbits
@ src/m4a_tables.o: region-same content at JP 0x081f6ed0 (US 0x08207220, shift -0x10350); incbin baserom.gba
	.global gScaleTable
gScaleTable:
	.incbin "baserom.gba", 0x1F6ED0, 0xB4
	.global gFreqTable
gFreqTable:
	.incbin "baserom.gba", 0x1F6F84, 0x30
	.global gPcmSamplesPerVBlankTable
gPcmSamplesPerVBlankTable:
	.incbin "baserom.gba", 0x1F6FB4, 0x18
	.global gCgbScaleTable
gCgbScaleTable:
	.incbin "baserom.gba", 0x1F6FCC, 0x84
	.global gCgbFreqTable
gCgbFreqTable:
	.incbin "baserom.gba", 0x1F7050, 0x18
	.global gNoiseTable
gNoiseTable:
	.incbin "baserom.gba", 0x1F7068, 0x3C
	.global gCgb3Vol
gCgb3Vol:
	.incbin "baserom.gba", 0x1F70A4, 0x10
	.global gClockTable
gClockTable:
	.incbin "baserom.gba", 0x1F70B4, 0x34
