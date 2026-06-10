	.section .rodata.dat_anim_trap_gas, "a", %progbits
	.align 2
@ src/data/ui/anim_trap_gas.o: region-same content at JP 0x085c9518 (US 0x085a0ff8, shift -0x-28520); incbin baserom.gba
	.global SpriteAnim_GasTrapVertical
SpriteAnim_GasTrapVertical:
	.incbin "data/residual/SpriteAnim_GasTrapVertical.bin"
	.global SpriteAnim_GasTrapHorizontal
SpriteAnim_GasTrapHorizontal:
	.incbin "data/residual/SpriteAnim_GasTrapHorizontal.bin"
