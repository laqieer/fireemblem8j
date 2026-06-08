	.section .rodata.dat_EventScr_SkirmishRetreat_ref, "a", %progbits
@ EventScr_SkirmishRetreat: region-different data, JP 0x085b9e3c read from funcmap-aligned code literal (US 0x08592058); incbin baserom.gba
	.global EventScr_SkirmishRetreat
EventScr_SkirmishRetreat:
	.incbin "baserom.gba", 0x5B9E3C, 0x60
