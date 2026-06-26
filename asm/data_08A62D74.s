@ data_08A62D74: region-different residue split into 3 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A62D74, "a", %progbits
	.global EventScr_Ch2Tutorial25
EventScr_Ch2Tutorial25:
	@ de-pointered (scripts/repoint_table.py): ptr=4 data=30 skip=1
	.4byte 0x00070228
	.4byte 0x00001120
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0x00380010
	.4byte 0x09431B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x010A1120
	.4byte 0x00010B41
	.4byte EventScr_Ch2Tutorial26
	.4byte 0x00000120
	.4byte 0x00001120
	.4byte 0x00020540
	.4byte 0x08A628A8
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00003D20
	.4byte 0x00000B40
	.4byte EventScr_Ch2_10
	.4byte 0x00070228
	.4byte 0x00000120
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0xFFFFFFFF
	.4byte 0x09351B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00063B25
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00020B41
	.4byte EventScr_Ch2Tutorial11
	.4byte 0x40003D20
	.4byte 0x00000120

	.section .data.residue.08A62DA4, "a", %progbits
	.global EventScr_Ch2Tutorial26
EventScr_Ch2Tutorial26:
	.incbin "data/residual/data_08A62D74.bin", 0x30, 0x28

	.section .data.residue.08A62DCC, "a", %progbits
	.global EventScr_Ch2_5
EventScr_Ch2_5:
	.incbin "data/residual/data_08A62D74.bin", 0x58, 0x34

