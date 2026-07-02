/* De-pointered from data/residual/EventListScr_Ch18b_Misc.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */
	.section .rodata.dat_EventListScr_Ch18b_Misc_ref, "a", %progbits
	.global EventListScr_Ch18b_Misc
EventListScr_Ch18b_Misc:
	.4byte 0x00030001
	.4byte frontier_df3_eventscr_ch_017_A6F47C + 0x1C
	.4byte 0x00000002
	.4byte 0x00000001
	.4byte data_085B9EE8
	.4byte 0x00000065
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte EventListScr_Ch18b_Turn
	.4byte data_08A5D270 + 0x3C
	.4byte data_08A5D270 + 0x40
	.4byte EventListScr_Ch18b_Misc
	.4byte EventListScr_Ch18b_Misc + 0x1C
	.4byte EventListScr_Ch18b_Misc + 0x20
	.4byte EventListScr_Ch18b_Misc + 0x24
	.4byte EventListScr_Ch18b_Misc + 0x28
