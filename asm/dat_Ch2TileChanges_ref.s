	.section .rodata.dat_Ch2TileChanges_ref, "a", %progbits
@ Ch2TileChanges: region-different data, JP 0x08a9b08c read from funcmap-aligned code literal (US 0x08a1e160); incbin baserom.gba
	.global Ch2TileChanges
Ch2TileChanges:
	.incbin "data/residual/Ch2TileChanges.bin"
