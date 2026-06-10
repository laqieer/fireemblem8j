	.section .rodata.dat_worldmap_gmapunit_p730, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085d2418 (US 0x085a8510, shift -0xFFFD60F8); incbin baserom.gba
	.global AiScr_AiB_PillageThenPursue
AiScr_AiB_PillageThenPursue:
	.incbin "data/residual/AiScr_AiB_PillageThenPursue.bin"
	.global AiScr_AiB_PillageThenEscape
AiScr_AiB_PillageThenEscape:
	.incbin "data/residual/AiScr_AiB_PillageThenEscape.bin"
	.global gAiScript_Escape
gAiScript_Escape:
	.incbin "data/residual/gAiScript_Escape.bin"
	.global gAiScript_CpData_1
gAiScript_CpData_1:
	.incbin "data/residual/gAiScript_CpData_1.bin"
