	.section .rodata.dat_particles_fx, "a", %progbits
	.align 2
@ src/data/ui/particles_fx.o: region-same content at JP 0x085cbfe4 (US 0x085a3ac0, shift -0x-28524); incbin baserom.gba
	.global gParticlesFx_3
gParticlesFx_3:
	.incbin "baserom.gba", 0x5CBFE4, 0x40
	.global gParticlesFx_4
gParticlesFx_4:
	.incbin "baserom.gba", 0x5CC024, 0x51C
	.global gParticlesFx_5
gParticlesFx_5:
	.incbin "baserom.gba", 0x5CC540, 0x20
	.global Img_LightRune
Img_LightRune:
	.incbin "baserom.gba", 0x5CC560, 0x1724
	.global Pal_LightRune
Pal_LightRune:
	.incbin "baserom.gba", 0x5CDC84, 0x20
	.global Tsa_LightRune
Tsa_LightRune:
	.incbin "baserom.gba", 0x5CDCA4, 0x2E0
