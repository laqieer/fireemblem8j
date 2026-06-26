@ data_08A625BC: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A625BC, "a", %progbits
	.global EventScr_Ch2_Turn1Player
EventScr_Ch2_Turn1Player:
	@ de-pointered (scripts/repoint_table.py): ptr=3 data=8 skip=1
	.4byte 0x00020540
	.4byte 0x08A62908
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00070228
	.4byte 0x00000120
	.4byte 0x00020540
	.4byte EventScr_Ch2_5
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00070228
	.4byte 0x00000120

	.section .data.residue.08A625D4, "a", %progbits
	.global EventScr_Ch2_Turn2Player
EventScr_Ch2_Turn2Player:
	.incbin "data/residual/data_08A625BC.bin", 0x18, 0x18

