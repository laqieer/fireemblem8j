	.section .rodata.dat_trap_fire_pike, "a", %progbits
	.align 2
@ src/data/ui/trap_fire_pike.o: region-same content at JP 0x085cae60 (US 0x085a2940, shift -0x-28520); incbin baserom.gba
	.global Img_FireTrap
Img_FireTrap:
	.incbin "graphics/misc_gfx2/Img_FireTrap.bin.lz"
	.global Pal_FireTrap
Pal_FireTrap:
	.incbin "graphics/misc_gfx2/Pal_FireTrap.gbapal"
