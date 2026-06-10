@ data_08A63D0C: region-different residue split into 7 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A63D0C, "a", %progbits
	.global EventScr_Ch4_3
EventScr_Ch4_3:
	.incbin "data/residual/data_08A63D0C.bin", 0x0, 0x3C

	.section .data.residue.08A63D48, "a", %progbits
	.global EventScr_Ch4_4
EventScr_Ch4_4:
	.incbin "data/residual/data_08A63D0C.bin", 0x3C, 0x18

	.section .data.residue.08A63D60, "a", %progbits
	.global EventScr_Ch4_5
EventScr_Ch4_5:
	.incbin "data/residual/data_08A63D0C.bin", 0x54, 0x1C

	.section .data.residue.08A63D7C, "a", %progbits
	.global EventScr_Ch4_6
EventScr_Ch4_6:
	.incbin "data/residual/data_08A63D0C.bin", 0x70, 0x18

	.section .data.residue.08A63D94, "a", %progbits
	.global EventScr_Ch4_7
EventScr_Ch4_7:
	.incbin "data/residual/data_08A63D0C.bin", 0x88, 0x20

	.section .data.residue.08A63DB4, "a", %progbits
	.global EventScr_Ch4_8
EventScr_Ch4_8:
	.incbin "data/residual/data_08A63D0C.bin", 0xA8, 0x24

	.section .data.residue.08A63DD8, "a", %progbits
	.global EventScr_Ch4_9
EventScr_Ch4_9:
	.incbin "data/residual/data_08A63D0C.bin", 0xCC, 0x20

