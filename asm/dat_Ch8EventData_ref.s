	.section .rodata.dat_Ch8EventData_ref, "a", %progbits
@ Ch8EventData: region-different data, JP 0x08a5b108 read from funcmap-aligned code literal (US 0x089e8fe4); incbin baserom.gba
	.global Ch8EventData
Ch8EventData:
	.incbin "data/residual/Ch8EventData.bin"
