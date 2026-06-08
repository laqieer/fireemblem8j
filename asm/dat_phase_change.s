	.section .rodata.dat_phase_change, "a", %progbits
	.align 2
@ src/data/ui/phase_change.o: region-same content at JP 0x085c7540 (US 0x0859f020, shift -0x-28520); incbin baserom.gba
	.global Img_PhaseChangeUnk
Img_PhaseChangeUnk:
	.incbin "baserom.gba", 0x5C7540, 0x3D8
	.global Img_PhaseChangePlayer
Img_PhaseChangePlayer:
	.incbin "baserom.gba", 0x5C7918, 0x634
	.global Pal_PhaseChangePlayer
Pal_PhaseChangePlayer:
	.incbin "baserom.gba", 0x5C7F4C, 0x20
	.global Img_PhaseChangeEnemy
Img_PhaseChangeEnemy:
	.incbin "baserom.gba", 0x5C7F6C, 0x61C
	.global Pal_PhaseChangeEnemy
Pal_PhaseChangeEnemy:
	.incbin "baserom.gba", 0x5C8588, 0x20
	.global Img_PhaseChangeOther
Img_PhaseChangeOther:
	.incbin "baserom.gba", 0x5C85A8, 0x610
	.global Pal_PhaseChangeOther
Pal_PhaseChangeOther:
	.incbin "baserom.gba", 0x5C8BB8, 0x20
	.global Pal_PhaseChange_0
Pal_PhaseChange_0:
	.incbin "baserom.gba", 0x5C8BD8, 0x20
	.global Img_PhaseChangeSquares
Img_PhaseChangeSquares:
	.incbin "baserom.gba", 0x5C8BF8, 0x160
