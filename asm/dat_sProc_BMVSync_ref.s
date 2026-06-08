	.section .rodata.dat_sProc_BMVSync_ref, "a", %progbits
@ sProc_BMVSync: region-different data, JP 0x085c5d98 read from funcmap-aligned code literal (US 0x0859d8b8); incbin baserom.gba
	.global sProc_BMVSync
sProc_BMVSync:
	.incbin "baserom.gba", 0x5C5D98, 0x50
