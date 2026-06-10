	.section .rodata.dat_particles_fx, "a", %progbits
	.align 2
@ src/data/ui/particles_fx.o: region-same content at JP 0x085cbfe4 (US 0x085a3ac0, shift -0x-28524); incbin baserom.gba
	.global gParticlesFx_3
gParticlesFx_3:
	.incbin "data/residual/gParticlesFx_3.bin"
	.global gParticlesFx_4
gParticlesFx_4:
	.incbin "data/residual/gParticlesFx_4.bin"
	.global gParticlesFx_5
gParticlesFx_5:
	.incbin "data/residual/gParticlesFx_5.bin"
	.global Img_LightRune
Img_LightRune:
	.incbin "graphics/misc_gfx2/Img_LightRune.bin.lz"
	.global Pal_LightRune
Pal_LightRune:
	.incbin "graphics/misc_gfx2/Pal_LightRune.gbapal"
	.global Tsa_LightRune
Tsa_LightRune:
	.incbin "graphics/misc_gfx2/Tsa_LightRune.bin.lz"
