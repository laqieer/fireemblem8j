	.section .rodata.dat_trap_gas, "a", %progbits
	.align 2
@ src/data/ui/trap_gas.o: region-same content at JP 0x085c9a30 (US 0x085a1510, shift -0x-28520); incbin baserom.gba
	.global Img_GasTrapVertical
Img_GasTrapVertical:
	.incbin "baserom.gba", 0x5C9A30, 0x5E8
	.global Img_GasTrapHorizontal
Img_GasTrapHorizontal:
	.incbin "baserom.gba", 0x5CA018, 0x574
	.global Pal_GasTrap
Pal_GasTrap:
	.incbin "baserom.gba", 0x5CA58C, 0x20
	.global Pal_ArrowTrap
Pal_ArrowTrap:
	.incbin "baserom.gba", 0x5CA5AC, 0x20
	.global Img_ArrowTrap
Img_ArrowTrap:
	.incbin "baserom.gba", 0x5CA5CC, 0x2D8
