	.section .rodata.dat_phase_change, "a", %progbits
	.align 2
@ src/data/ui/phase_change.o: region-same content at JP 0x085c7540 (US 0x0859f020, shift -0x-28520); incbin baserom.gba
	.global Img_PhaseChangeUnk
Img_PhaseChangeUnk:
	.incbin "graphics/misc_gfx/Img_PhaseChangeUnk.4bpp.lz"
	.global Img_PhaseChangePlayer
Img_PhaseChangePlayer:
	.incbin "graphics/misc_gfx/Img_PhaseChangePlayer.4bpp.lz"
	.global Pal_PhaseChangePlayer
Pal_PhaseChangePlayer:
	.incbin "graphics/misc_gfx/Pal_PhaseChangePlayer.gbapal"
	.global Img_PhaseChangeEnemy
Img_PhaseChangeEnemy:
	.incbin "graphics/misc_gfx/Img_PhaseChangeEnemy.4bpp.lz"
	.global Pal_PhaseChangeEnemy
Pal_PhaseChangeEnemy:
	.incbin "graphics/misc_gfx/Pal_PhaseChangeEnemy.gbapal"
	.global Img_PhaseChangeOther
Img_PhaseChangeOther:
	.incbin "graphics/misc_gfx/Img_PhaseChangeOther.4bpp.lz"
	.global Pal_PhaseChangeOther
Pal_PhaseChangeOther:
	.incbin "graphics/misc_gfx/Pal_PhaseChangeOther.gbapal"
	.global Pal_PhaseChange_0
Pal_PhaseChange_0:
	.incbin "graphics/misc_gfx/Pal_PhaseChange_0.gbapal"
	.global Img_PhaseChangeSquares
Img_PhaseChangeSquares:
	.incbin "graphics/misc_gfx/Img_PhaseChangeSquares.4bpp.lz"
