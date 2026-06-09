	.section .rodata.dat_unit_icon_move_table_ref, "a", %progbits
@ unit_icon_move_table: region-different data, JP 0x08a13488; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global unit_icon_move_table
unit_icon_move_table:
	.incbin "baserom.gba", 0xA13488, 0x3F8
