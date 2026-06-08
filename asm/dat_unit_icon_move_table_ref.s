	.section .rodata.dat_unit_icon_move_table_ref, "a", %progbits
@ unit_icon_move_table: region-different data, JP 0x08a13488 read from funcmap-aligned code literal (US 0x089a2e00); incbin baserom.gba
	.global unit_icon_move_table
unit_icon_move_table:
	.incbin "baserom.gba", 0xA13488, 0x3F8
