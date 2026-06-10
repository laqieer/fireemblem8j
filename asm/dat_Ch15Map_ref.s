	.section .rodata.dat_Ch15Map_ref, "a", %progbits
@ Ch15Map: region-different data, JP 0x08a9b78c read from funcmap-aligned code literal (US 0x081b52cc); incbin baserom.gba
	.global Ch15Map
Ch15Map:
	.incbin "data/residual/Ch15Map.bin"
