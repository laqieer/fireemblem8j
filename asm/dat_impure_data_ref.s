	.section .rodata.dat_impure_data_ref, "a", %progbits
@ impure_data: region-different data, JP 0x08bb8788 read from funcmap-aligned code literal (US 0x08b1f734); incbin baserom.gba
	.global impure_data
impure_data:
	.incbin "baserom.gba", 0xBB8788, 0x2EC
