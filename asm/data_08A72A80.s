@ data_08A72A80: region-different residue split into 4 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A72A80, "a", %progbits
	.global gProcScr_SSBgOffsetCtrl
gProcScr_SSBgOffsetCtrl:
	@ de-pointered (scripts/repoint_table.py): ptr=3 data=54 skip=21
	.4byte 0x00000003
	.4byte 0x0808ABAD
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte 0x0808A6D9
	.4byte 0x00000002
	.4byte 0x080300D5
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte 0x0808A73D
	.4byte 0x00000002
	.4byte 0x080048B5
	.4byte 0x00000002
	.4byte 0x0808A8FD
	.4byte 0x00000005
	.4byte 0x08A728FC
	.4byte 0x00000005
	.4byte gProcScr_SSPageNameCtrl
	.4byte 0x00000005
	.4byte gProcScr_SSPageNumCtrl
	.4byte 0x00000005
	.4byte gProcScr_SSBgOffsetCtrl
	.4byte 0x0001000C
	.4byte 0x00000000
	.4byte 0x0000000B
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte 0x0808AB99
	.4byte 0x0001000B
	.4byte 0x00000000
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x00000003
	.4byte 0x0808A9C9
	.4byte 0x000A000B
	.4byte 0x00000000
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x00000009
	.4byte 0x08A728FC
	.4byte 0x00000002
	.4byte 0x0808AB41
	.4byte 0x00000002
	.4byte 0x08030109
	.4byte 0x00000002
	.4byte 0x0807B4B9
	.4byte 0x00000002
	.4byte 0x080048D9
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte 0x0808AF89
	.4byte 0x00000003
	.4byte 0x0808AFC9
	.4byte 0x0063000B
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte 0x0808AFF1
	.4byte 0x00000003
	.4byte 0x0808B045
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0001000E
	.4byte 0x00000000
	.4byte 0x0000000B
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte 0x0808B2ED
	.4byte 0x00000003
	.4byte 0x0808B315
	.4byte 0x00000002
	.4byte 0x0808B2A5
	.4byte 0x00000000
	.4byte 0x00000000

	.section .data.residue.08A72A90, "a", %progbits
	.global gProcScr_StatScreen
gProcScr_StatScreen:
	.incbin "data/residual/data_08A72A80.bin", 0x10, 0xC0

	.section .data.residue.08A72B50, "a", %progbits
	.global gProcScr_HelpBox
gProcScr_HelpBox:
	.incbin "data/residual/data_08A72A80.bin", 0xD0, 0x38

	.section .data.residue.08A72B88, "a", %progbits
	.global gProcScr_HelpBoxMoveCtrl
gProcScr_HelpBoxMoveCtrl:
	.incbin "data/residual/data_08A72A80.bin", 0x108, 0x30

