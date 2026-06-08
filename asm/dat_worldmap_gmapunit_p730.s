	.section .rodata.dat_worldmap_gmapunit_p730, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085d2418 (US 0x085a8510, shift -0xFFFD60F8); incbin baserom.gba
	.global AiScr_AiB_PillageThenPursue
AiScr_AiB_PillageThenPursue:
	.incbin "baserom.gba", 0x5D2418, 0x30
	.global AiScr_AiB_PillageThenEscape
AiScr_AiB_PillageThenEscape:
	.incbin "baserom.gba", 0x5D2448, 0x30
	.global gAiScript_Escape
gAiScript_Escape:
	.incbin "baserom.gba", 0x5D2478, 0x20
	.global gAiScript_CpData_1
gAiScript_CpData_1:
	.incbin "baserom.gba", 0x5D2498, 0x40
