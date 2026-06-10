	.section .rodata.dat_Ch8MapChanges_ref, "a", %progbits
@ Ch8MapChanges: region-different data, JP 0x08a9b37c read from funcmap-aligned code literal (US 0x08a1e450); incbin baserom.gba
	.global Ch8MapChanges
Ch8MapChanges:
	.incbin "data/residual/Ch8MapChanges.bin"
