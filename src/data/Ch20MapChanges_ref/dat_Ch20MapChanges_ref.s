/* De-pointered from data/residual/Ch20MapChanges.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */
	.section .rodata.dat_Ch20MapChanges_ref, "a", %progbits
	.global Ch20MapChanges
Ch20MapChanges:
	.4byte Ch19MapChanges + 0x50
	.4byte Ch19MapChanges + 0xC0
	.4byte Ch19MapChanges + 0xC4
	.4byte Ch19MapChanges + 0xD4
	.4byte Ch19MapChanges + 0x114
	.4byte Ch19MapChanges + 0x118
	.4byte Ch19MapChanges + 0x11C
	.4byte Ch19MapChanges + 0x120
	.4byte gUidebug_2 + 0x4D1
	.4byte frontier_df4_menu_005_A5FFAD + 0x53
	.4byte frontier_df3_unitdef_b_023_91512C_p34
	.4byte frontier_df3_unitdef_b_023_91512C_p34
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte frontier_df3_eventscr_ch_003_A6AA20 + 0x130
	.4byte frontier_df3_eventscr_ch_003_A6AA20 + 0x350
	.4byte 0x000D0002
	.4byte frontier_df3_eventscr_ch_005_A6B460 + 0xC8
	.4byte 0x0000FF01
	.4byte 0x000B0002
	.4byte frontier_df3_eventscr_ch_005_A6B460 + 0x20
	.4byte 0x0000FF01
	.4byte 0x000C0002
	.4byte frontier_df3_eventscr_ch_005_A6B460 + 0x74
	.4byte 0x0000FF01
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000008
	.4byte 0x00000001
	.4byte 0x00121304
	.4byte 0x00000008
	.4byte 0x00000001
	.4byte 0x00121312
	.4byte 0x00000007
	.4byte 0x0000005B
	.4byte 0x00141215
	.4byte 0x00000007
	.4byte 0x00000088
	.4byte 0x00141202
	.4byte 0x00000000
	.4byte 0x00030001
	.4byte EventScr_Ch21A_0
	.4byte 0x00000002
	.4byte 0x000A000B
	.4byte frontier_df3_eventscr_ch_005_A6B460 + 0xA8
	.4byte 0x060C050A
	.4byte 0x0008000B
	.4byte frontier_df3_eventscr_ch_005_A6B460
	.4byte 0x0C0B0700
	.4byte 0x0009000B
	.4byte frontier_df3_eventscr_ch_005_A6B460 + 0x54
	.4byte 0x0C16070C
	.4byte 0x000E000B
	.4byte frontier_df3_eventscr_ch_005_A6B460 + 0xFC
	.4byte 0x04150001
	.4byte 0x00000001
	.4byte data_085B9EE8
	.4byte 0x00000065
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
