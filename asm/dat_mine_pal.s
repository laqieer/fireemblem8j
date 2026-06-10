	.section .rodata.dat_mine_pal, "a", %progbits
	.align 2
@ src/data/ui/mine_pal.o: region-same content at JP 0x085d1dd0 (US 0x085a7ec8, shift -0x-29F08); incbin baserom.gba
	.global Pal_MineFx
Pal_MineFx:
	.incbin "graphics/misc_gfx2/Pal_MineFx.gbapal"
	.global Pal_EventCursorShinning
Pal_EventCursorShinning:
	.incbin "graphics/misc_gfx2/Pal_EventCursorShinning.gbapal"
