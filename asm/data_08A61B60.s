@ data_08A61B60: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A61B60, "a", %progbits
	.global EventScr_Ch1_Turn1Player
EventScr_Ch1_Turn1Player:
	.incbin "data/residual/data_08A61B60.bin", 0x0, 0x18

	.section .data.residue.08A61B78, "a", %progbits
	.global EventScr_Ch1_Turn1Enemy
EventScr_Ch1_Turn1Enemy:
	.incbin "data/residual/data_08A61B60.bin", 0x18, 0x28

