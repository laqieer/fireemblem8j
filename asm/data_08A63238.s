@ data_08A63238: region-different residue split into 2 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A63238, "a", %progbits
	.global EventScr_Ch2Tutorial29
EventScr_Ch2Tutorial29:
	@ de-pointered (scripts/repoint_table.py): ptr=3 data=17 skip=0
	.4byte 0x00070228
	.4byte 0x00001120
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0x00380010
	.4byte 0x09471B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x010A1120
	.4byte 0x00010B41
	.4byte EventScr_Ch2Tutorial30
	.4byte 0x00000120
	.4byte 0x00001120
	.4byte 0x00020540
	.4byte EventScr_Ch2_9
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00003D20
	.4byte 0x00070228
	.4byte 0x00000120

	.section .data.residue.08A63268, "a", %progbits
	.global EventScr_Ch2Tutorial30
EventScr_Ch2Tutorial30:
	@ de-pointered (scripts/repoint_table.py): ptr=3 data=17 skip=0
	.4byte 0x00070228
	.4byte 0x00001120
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0x00380010
	.4byte 0x09471B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x010A1120
	.4byte 0x00010B41
	.4byte EventScr_Ch2Tutorial30
	.4byte 0x00000120
	.4byte 0x00001120
	.4byte 0x00020540
	.4byte EventScr_Ch2_9
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00003D20
	.4byte 0x00070228
	.4byte 0x00000120

