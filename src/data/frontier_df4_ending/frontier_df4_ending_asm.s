@ Descriptive assembly for the gap0 INCBIN blob in frontier_df4_ending.c.
@ The blob is a self-referential struct: a RAM pointer, two 0x220-byte tables,
@ then two ABSOLUTE self-pointers to those tables (JP: 0x08AC05A0 / 0x08AC07C0).
@ As a raw INCBIN_U8 those trailing pointers were BAKED hex (no relocation), so a
@ ROM shift would rot them. Emitting the tables as labels + `.4byte <label>` makes
@ the two self-pointers RELOCATABLE (R_ARM_ABS32) while byte-identical at JP layout.
@ Byte-exact via `make compare`; mirrors the frontier_df4_menu_asm.s pattern (#152).

	.section .data.frontier_df4_ending.gap0, "aw", %progbits
	.global frontier_df4_ending_000_AC059C
frontier_df4_ending_000_AC059C:
	.4byte 0x020007A0
frontier_df4_ending_000_tableA:
	.incbin "graphics/frontier_df4_ending/frontier_df4_ending_000_AC059C.bin", 0x004, 0x220
frontier_df4_ending_000_tableB:
	.incbin "graphics/frontier_df4_ending/frontier_df4_ending_000_AC059C.bin", 0x224, 0x220
	.4byte frontier_df4_ending_000_tableA
	.4byte frontier_df4_ending_000_tableB
