	.section .rodata.dat_gAiScript_CpData_2_ref, "a", %progbits
@ gAiScript_CpData_2: region-different data, JP 0x085d24d8 read from funcmap-aligned code literal (US 0x085a85d0); incbin baserom.gba
	.global gAiScript_CpData_2
gAiScript_CpData_2:
	.incbin "baserom.gba", 0x5D24D8, 0x50
