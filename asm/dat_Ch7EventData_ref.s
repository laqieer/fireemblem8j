	.section .rodata.dat_Ch7EventData_ref, "a", %progbits
@ Ch7EventData: region-different data, JP 0x08a5af94 read from funcmap-aligned code literal (US 0x089e8e70); incbin baserom.gba
	.global Ch7EventData
Ch7EventData:
	.incbin "data/residual/Ch7EventData.bin"
