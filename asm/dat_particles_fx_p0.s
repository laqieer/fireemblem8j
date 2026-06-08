	.section .rodata.dat_particles_fx_p0, "a", %progbits
@ src/data/ui/particles_fx.o: region-same content at JP 0x085cbe84 (US 0x085a3964, shift -0xFFFD7AE0); incbin baserom.gba
	.global gParticlesFx_0
gParticlesFx_0:
	.incbin "baserom.gba", 0x5CBE84, 0x88
	.global gParticlesFx_1
gParticlesFx_1:
	.incbin "baserom.gba", 0x5CBF0C, 0x98
