	.section .rodata.dat_trap_gas, "a", %progbits
	.align 2
@ src/data/ui/trap_gas.o: region-same content at JP 0x085c9a30 (US 0x085a1510, shift -0x-28520); incbin baserom.gba
	.global Img_GasTrapVertical
Img_GasTrapVertical:
	.incbin "graphics/misc_gfx2/Img_GasTrapVertical.bin.lz"
	.global Img_GasTrapHorizontal
Img_GasTrapHorizontal:
	.incbin "graphics/misc_gfx2/Img_GasTrapHorizontal.bin.lz"
	.global Pal_GasTrap
Pal_GasTrap:
	.incbin "graphics/misc_gfx2/Pal_GasTrap.gbapal"
	.global Pal_ArrowTrap
Pal_ArrowTrap:
	.incbin "graphics/misc_gfx2/Pal_ArrowTrap.gbapal"
	.global Img_ArrowTrap
Img_ArrowTrap:
	.incbin "graphics/misc_gfx2/Img_ArrowTrap.bin.lz"
