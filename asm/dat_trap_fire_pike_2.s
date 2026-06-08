	.section .rodata.dat_trap_fire_pike_2, "a", %progbits
	.align 2
@ src/data/ui/trap_fire_pike_2.o: region-same content at JP 0x085cb9b0 (US 0x085a3490, shift -0x-28520); incbin baserom.gba
	.global Pal_FireTrap2
Pal_FireTrap2:
	.incbin "baserom.gba", 0x5CB9B0, 0x20
	.global Img_PikeTrap
Img_PikeTrap:
	.incbin "baserom.gba", 0x5CB9D0, 0x280
