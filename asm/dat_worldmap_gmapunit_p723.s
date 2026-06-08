	.section .rodata.dat_worldmap_gmapunit_p723, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085cf274 (US 0x085a5a60, shift -0xFFFD67EC); incbin baserom.gba
	.global Img_EventWarp
Img_EventWarp:
	.incbin "baserom.gba", 0x5CF274, 0x748
	.global Pal_EventWarp
Pal_EventWarp:
	.incbin "baserom.gba", 0x5CF9BC, 0x20
	.global Tsa_EventWarp
Tsa_EventWarp:
	.incbin "baserom.gba", 0x5CF9DC, 0x1C4
	.global gParticlesFx_6
gParticlesFx_6:
	.incbin "baserom.gba", 0x5CFBA0, 0xB0
	.global gParticlesFx_7
gParticlesFx_7:
	.incbin "baserom.gba", 0x5CFC50, 0x40
	.global Tsa_PlayerRankFog
Tsa_PlayerRankFog:
	.incbin "baserom.gba", 0x5CFC90, 0x804
	.global Img_DanceringFx
Img_DanceringFx:
	.incbin "baserom.gba", 0x5D0494, 0xDE4
	.global Tsa_DanceringFx
Tsa_DanceringFx:
	.incbin "baserom.gba", 0x5D1278, 0x23C
	.global Pal_DanceringFx
Pal_DanceringFx:
	.incbin "baserom.gba", 0x5D14B4, 0x20
