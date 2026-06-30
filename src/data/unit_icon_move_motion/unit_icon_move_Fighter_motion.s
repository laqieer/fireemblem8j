.section .rodata.unit_icon_move_Fighter_motion,"a",%progbits

@ Unit-icon move (AP) motion table, editable AP-motion source ported from
@ fe8u src/data/unit_icon/const_data_unit_icon_move.s (unit_icon_move_Fighter_motion).
@ Region-same: byte-identical to the JP ROM blob formerly at 81D3CF8
@ (verified by `make compare`). Frame `.2byte 1,0xE0,0x81F0,0,0`-style words are
@ OAM attr1/attr2 data, NOT pointers — the table is fully shiftable.

	.global unit_icon_move_Fighter_motion
unit_icon_move_Fighter_motion:
	.2byte (unit_icon_move_Fighter_frame_list - unit_icon_move_Fighter_motion), (unit_icon_move_Fighter_anim_list - unit_icon_move_Fighter_motion) @ header

unit_icon_move_Fighter_frame_list: @ +$4
	.2byte (unit_icon_move_Fighter_frame_0 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_1 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_2 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_3 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_4 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_5 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_6 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_7 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_8 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_9 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_10 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_11 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_12 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_13 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_14 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_15 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_16 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_17 - unit_icon_move_Fighter_frame_list)
	.2byte (unit_icon_move_Fighter_frame_18 - unit_icon_move_Fighter_frame_list)

unit_icon_move_Fighter_anim_list: @ +$2A
	.2byte (unit_icon_move_Fighter_anim_0 - unit_icon_move_Fighter_anim_list)
	.2byte (unit_icon_move_Fighter_anim_1 - unit_icon_move_Fighter_anim_list)
	.2byte (unit_icon_move_Fighter_anim_2 - unit_icon_move_Fighter_anim_list)
	.2byte (unit_icon_move_Fighter_anim_3 - unit_icon_move_Fighter_anim_list)
	.2byte (unit_icon_move_Fighter_anim_4 - unit_icon_move_Fighter_anim_list)

unit_icon_move_Fighter_frame_0: @ +$34
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Fighter_frame_1: @ +$3E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Fighter_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Fighter_frame_3: @ +$52
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Fighter_frame_4: @ +$5C
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x0 @ Sheet Tile #0

unit_icon_move_Fighter_frame_5: @ +$66
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x10 @ Sheet Tile #0

unit_icon_move_Fighter_frame_6: @ +$70
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x20 @ Sheet Tile #0

unit_icon_move_Fighter_frame_7: @ +$7A
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x91F0, 0x0 @ OAM Data #0
	.2byte 0x30 @ Sheet Tile #0

unit_icon_move_Fighter_frame_8: @ +$84
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x40 @ Sheet Tile #0

unit_icon_move_Fighter_frame_9: @ +$8E
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x50 @ Sheet Tile #0

unit_icon_move_Fighter_frame_10: @ +$98
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x60 @ Sheet Tile #0

unit_icon_move_Fighter_frame_11: @ +$A2
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x70 @ Sheet Tile #0

unit_icon_move_Fighter_frame_12: @ +$AC
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x80 @ Sheet Tile #0

unit_icon_move_Fighter_frame_13: @ +$B6
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0x90 @ Sheet Tile #0

unit_icon_move_Fighter_frame_14: @ +$C0
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xA0 @ Sheet Tile #0

unit_icon_move_Fighter_frame_15: @ +$CA
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xB0 @ Sheet Tile #0

unit_icon_move_Fighter_frame_16: @ +$D4
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xE0 @ Sheet Tile #0

unit_icon_move_Fighter_frame_17: @ +$DE
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xD0 @ Sheet Tile #0

unit_icon_move_Fighter_frame_18: @ +$E8
	.2byte 1 @ oam entries
	.2byte 0xE0, 0x81F0, 0x0 @ OAM Data #0
	.2byte 0xC0 @ Sheet Tile #0

unit_icon_move_Fighter_anim_0: @ +$F2
	.2byte 13,  0
	.2byte  6,  1
	.2byte 13,  2
	.2byte  6,  3

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fighter_anim_1: @ +$106
	.2byte 13,  4
	.2byte  6,  5
	.2byte 13,  6
	.2byte  6,  7

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fighter_anim_2: @ +$11A
	.2byte 13,  8
	.2byte  6,  9
	.2byte 13, 10
	.2byte  6, 11

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fighter_anim_3: @ +$12E
	.2byte 13, 12
	.2byte  6, 13
	.2byte 13, 14
	.2byte  6, 15

	.2byte 0, (-1) @ loop back to start

unit_icon_move_Fighter_anim_4: @ +$142
	.2byte 20, 16
	.2byte  4, 17
	.2byte 20, 18
	.2byte  4, 17

	.2byte 0, (-1) @ loop back to start

	.align 2, 0

