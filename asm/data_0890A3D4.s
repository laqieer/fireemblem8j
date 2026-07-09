@ byte-neutral SPLIT of UnitDef_Ch5xUnits_1 (72 B) into 5 named sub-objects.
@ Excluded mirror (DATA_INCBIN_ASM_EXCLUDE): NOT linked, only text-scanned
@ by the named-symbols metric. Real bytes come from the src .c object;
@ make compare is the oracle.

	.section .data.residue.0890A3D4, "a", %progbits
	.global UnitDef_Ch5xUnits_1
UnitDef_Ch5xUnits_1:
	.incbin "data/residual/data_0890A3D4.bin", 0x0, 0x28
	.section .data.residue.0890A3FC, "a", %progbits
	.global REDA_Ch5xAlly_2_EPHRAIM
REDA_Ch5xAlly_2_EPHRAIM:
	.incbin "data/residual/data_0890A3D4.bin", 0x28, 0x8
	.section .data.residue.0890A404, "a", %progbits
	.global REDA_Ch5xAlly_2_FORDE
REDA_Ch5xAlly_2_FORDE:
	.incbin "data/residual/data_0890A3D4.bin", 0x30, 0x8
	.section .data.residue.0890A40C, "a", %progbits
	.global REDA_Ch5xAlly_2_KYLE
REDA_Ch5xAlly_2_KYLE:
	.incbin "data/residual/data_0890A3D4.bin", 0x38, 0x8
	.section .data.residue.0890A414, "a", %progbits
	.global REDA_Ch5xAlly_2_ORSON_CH5X
REDA_Ch5xAlly_2_ORSON_CH5X:
	.incbin "data/residual/data_0890A3D4.bin", 0x40, 0x8
