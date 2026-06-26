@ data_08A625BC: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A625BC, "a", %progbits
	.global EventScr_Ch2_Turn1Player
EventScr_Ch2_Turn1Player:
	.incbin "data/residual/data_08A625BC.bin", 0x0, 0x18

	.section .data.residue.08A625D4, "a", %progbits
	.global EventScr_Ch2_Turn2Player
EventScr_Ch2_Turn2Player:
	.incbin "data/residual/data_08A625BC.bin", 0x18, 0x18

