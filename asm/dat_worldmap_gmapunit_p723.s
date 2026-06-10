	.section .rodata.dat_worldmap_gmapunit_p723, "a", %progbits
@ src/worldmap_gmapunit.o: region-same content at JP 0x085cf274 (US 0x085a5a60, shift -0xFFFD67EC); incbin baserom.gba
	.global Img_EventWarp
Img_EventWarp:
	.incbin "graphics/gmapunit/Img_EventWarp.bin.lz"
	.global Pal_EventWarp
Pal_EventWarp:
	.incbin "graphics/gmapunit/Pal_EventWarp.gbapal"
	.global Tsa_EventWarp
Tsa_EventWarp:
	.incbin "graphics/gmapunit/Tsa_EventWarp.bin.lz"
	.global gParticlesFx_6
gParticlesFx_6:
	.incbin "baserom.gba", 0x5CFBA0, 0xB0
	.global gParticlesFx_7
gParticlesFx_7:
	.incbin "baserom.gba", 0x5CFC50, 0x40
	.global Tsa_PlayerRankFog
Tsa_PlayerRankFog:
	.incbin "graphics/gmapunit/Tsa_PlayerRankFog.bin"
	.global Img_DanceringFx
Img_DanceringFx:
	.incbin "graphics/gmapunit/Img_DanceringFx.bin.lz"
	.global Tsa_DanceringFx
Tsa_DanceringFx:
	.incbin "graphics/gmapunit/Tsa_DanceringFx.bin.lz"
	.global Pal_DanceringFx
Pal_DanceringFx:
	.incbin "graphics/gmapunit/Pal_DanceringFx.gbapal"
