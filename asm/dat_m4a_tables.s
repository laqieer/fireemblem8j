	.section .rodata.dat_m4a_tables, "a", %progbits
@ src/m4a_tables.o: region-same content at JP 0x081f6ed0 (US 0x08207220, shift -0x10350); incbin baserom.gba
	.global gScaleTable
gScaleTable:
	.incbin "data/sound/gScaleTable.bin"
	.global gFreqTable
gFreqTable:
	.incbin "data/sound/gFreqTable.bin"
	.global gPcmSamplesPerVBlankTable
gPcmSamplesPerVBlankTable:
	.incbin "data/sound/gPcmSamplesPerVBlankTable.bin"
	.global gCgbScaleTable
gCgbScaleTable:
	.incbin "data/sound/gCgbScaleTable.bin"
	.global gCgbFreqTable
gCgbFreqTable:
	.incbin "data/sound/gCgbFreqTable.bin"
	.global gNoiseTable
gNoiseTable:
	.incbin "data/sound/gNoiseTable.bin"
	.global gCgb3Vol
gCgb3Vol:
	.incbin "data/sound/gCgb3Vol.bin"
	.global gClockTable
gClockTable:
	.incbin "data/sound/gClockTable.bin"
