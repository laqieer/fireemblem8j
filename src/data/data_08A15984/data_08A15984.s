/* ProcScr_ManimShiftingSineWaveScanlineBuf (0x08A15984): a process script with two
 * real Thumb function pointers (onInit/onLoop). De-pointered to relocatable symbol
 * refs (.4byte fn + 1, the Thumb bit) so the ROM is SHIFTABLE; byte-identical to
 * baserom (gated by `make compare`). Emitted as a pure asm block to avoid a typed
 * header decl of the referenced fns conflicting with the global prototypes. */
	.section .data.residue.08A15984, "aw", %progbits
	.global data_08A15984
data_08A15984:
	.4byte 0x00000002
	.4byte sub_80848F0 + 0x1
	.4byte 0x00000003
	.4byte ManimShiftingSineWaveScanlineBuf_Loop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
