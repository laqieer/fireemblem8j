	.section .rodata.dat_worldmap_gmapunit_p729, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085d2338 (US 0x085a8430, shift -0xFFFD60F8); incbin baserom.gba
	.global gAiScript_CpData_0
gAiScript_CpData_0:
	.incbin "baserom.gba", 0x5D2338, 0x20
	.global AiScr_AiB_MoveToEnemyAfterOneTurn
AiScr_AiB_MoveToEnemyAfterOneTurn:
	.incbin "baserom.gba", 0x5D2358, 0x30
	.global AiScr_AiB_PillageThenPursueAfterOneTurn
AiScr_AiB_PillageThenPursueAfterOneTurn:
	.incbin "baserom.gba", 0x5D2388, 0x30
