@ data_08A668DC: region-different residue split into 4 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A668DC, "a", %progbits
	.global EventScr_Ch10A_9
EventScr_Ch10A_9:
	@ de-pointered (scripts/repoint_table.py): ptr=1 data=31 skip=4
	.4byte 0x00001520
	.4byte 0x00020540
	.4byte 0x00000000
	.4byte 0x00030540
	.4byte 0x00000A04
	.4byte 0x00000A40
	.4byte 0x08A60448
	.4byte 0x00001521
	.4byte 0x00070228
	.4byte 0x00000120
	.4byte 0x00001520
	.4byte 0x00020540
	.4byte 0x00000000
	.4byte 0x00030540
	.4byte 0x00000A05
	.4byte 0x00000A40
	.4byte 0x08A60448
	.4byte 0x00001521
	.4byte 0x00070228
	.4byte 0x00000120
	.4byte 0x00001520
	.4byte 0x00020540
	.4byte 0x00000000
	.4byte 0x00030540
	.4byte 0x00000A06
	.4byte 0x00000A40
	.4byte 0x08A60448
	.4byte 0x00001521
	.4byte 0x00070228
	.4byte 0x00000120
	.4byte 0x00020540
	.4byte UnitDef_Ch10AEnemy_2
	.4byte 0x00000A40
	.4byte 0x08A603AC
	.4byte 0x00070228
	.4byte 0x00000120

	.section .data.residue.08A66904, "a", %progbits
	.global EventScr_Ch10A_10
EventScr_Ch10A_10:
	.incbin "data/residual/data_08A668DC.bin", 0x28, 0x28

	.section .data.residue.08A6692C, "a", %progbits
	.global EventScr_Ch10A_11
EventScr_Ch10A_11:
	.incbin "data/residual/data_08A668DC.bin", 0x50, 0x28

	.section .data.residue.08A66954, "a", %progbits
	.global EventScr_Ch10A_12
EventScr_Ch10A_12:
	.incbin "data/residual/data_08A668DC.bin", 0x78, 0x18

