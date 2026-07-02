/* De-pointered from data/residual/EventListScr_Ch2_Location.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */
	.section .rodata.dat_EventListScr_Ch2_Location_ref, "a", %progbits
	.global EventListScr_Ch2_Location
EventListScr_Ch2_Location:
	.4byte 0x00090006
	.4byte EventScr_Ch2_Village1
	.4byte 0x00100204
	.4byte 0x00090005
	.4byte 0x00000001
	.4byte 0x00200104
	.4byte 0x000A0006
	.4byte data_08A62808
	.4byte 0x00100207
	.4byte 0x000A0005
	.4byte 0x00000001
	.4byte 0x00200107
	.4byte 0x000B0006
	.4byte data_08A62808 + 0x3C
	.4byte 0x00100C01
	.4byte 0x000B0005
	.4byte 0x00000001
	.4byte 0x00200B01
	.4byte 0x0000000A
	.4byte gUidebug_2 + 0x120
	.4byte 0x00160705
	.4byte 0x00000000
