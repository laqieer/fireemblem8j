	.section .rodata.dat_Ch3MapChanges_ref, "a", %progbits
@ Ch3MapChanges: region-different data, JP 0x08a9b120 read from funcmap-aligned code literal (US 0x08a1e1f4); incbin baserom.gba
	.global Ch3MapChanges
Ch3MapChanges:
	.incbin "data/residual/Ch3MapChanges.bin"
