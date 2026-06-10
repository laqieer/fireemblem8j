	.section .rodata.dat_const_data_unit_icon_move_p58, "a", %progbits
@ src/data/unit_icon/const_data_unit_icon_move.o: region-same content at JP 0x081d7a68 (US 0x081e80b0, shift -0x10648); incbin baserom.gba
	.global unit_icon_move_Bard_sheet
unit_icon_move_Bard_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Bard_sheet.4bpp.lz"
	.global unit_icon_move_Bard_motion
unit_icon_move_Bard_motion:
	.incbin "baserom.gba", 0x1D81F8, 0x190
	.global unit_icon_move_Pegasus_Knight_sheet
unit_icon_move_Pegasus_Knight_sheet:
	.incbin "graphics/unit_icon/move/unit_icon_move_Pegasus_Knight_sheet.4bpp.lz"
