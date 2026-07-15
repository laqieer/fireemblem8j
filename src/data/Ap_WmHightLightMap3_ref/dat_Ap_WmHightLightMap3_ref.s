.section .rodata.dat_Ap_WmHightLightMap3_ref, "a", %progbits

@ Ap_WmHightLightMap3: editable AP-motion source for the JP worldmap nation
@ highlight animation (Jehanna). Region-different from fe8u
@ src/data/worldmap/anim_worldmap_highlight.s (JP frame_1 has 2 OAM entries, not
@ 3, so the table is 92 B not 100 B). Decoded from the JP ROM blob at 0x08B2523C
@ (was data/residual/Ap_WmHightLightMap3.bin) into the motion->frame_list->
@ anim_list->frames->anims form; byte-identical, verified by `make compare`.
@ The frame `.2byte` words are OAM attr0/attr1/attr2 data, NOT pointers — fully
@ shiftable.

	.global Ap_WmHightLightMap3
	.type Ap_WmHightLightMap3, %object
Ap_WmHightLightMap3:
Ap_WmHightLightMap3_motion:
	.2byte (Ap_WmHightLightMap3_frame_list - Ap_WmHightLightMap3_motion), (Ap_WmHightLightMap3_anim_list - Ap_WmHightLightMap3_motion) @ header

Ap_WmHightLightMap3_frame_list: @ +$4
	.2byte (Ap_WmHightLightMap3_frame_0 - Ap_WmHightLightMap3_frame_list)
	.2byte (Ap_WmHightLightMap3_frame_1 - Ap_WmHightLightMap3_frame_list)

Ap_WmHightLightMap3_anim_list: @ +$8
	.2byte (Ap_WmHightLightMap3_anim_0 - Ap_WmHightLightMap3_anim_list)
	.2byte (Ap_WmHightLightMap3_anim_1 - Ap_WmHightLightMap3_anim_list)

Ap_WmHightLightMap3_frame_0: @ +$C
	.2byte 8 @ oam entries
	.2byte 0x40EB, 0xC1D9, 0x0 @ OAM Data #0
	.2byte 0x80EB, 0x8019, 0x8 @ OAM Data #1
	.2byte 0x80EB, 0x4029, 0xA @ OAM Data #2
	.2byte 0x400B, 0xC1D9, 0xB @ OAM Data #3
	.2byte 0x40DB, 0x81E1, 0x15 @ OAM Data #4
	.2byte 0x40DB, 0x8001, 0x19 @ OAM Data #5
	.2byte 0xB, 0x4019, 0x13 @ OAM Data #6
	.2byte 0xFB, 0x31, 0x1D @ OAM Data #7

Ap_WmHightLightMap3_frame_1: @ +$3E
	.2byte 2 @ oam entries
	.2byte 0x40F9, 0x81E3, 0x53 @ OAM Data #0
	.2byte 0x40F9, 0x8003, 0x57 @ OAM Data #1

Ap_WmHightLightMap3_anim_0: @ +$4C
	.2byte  4,  0

	.2byte 0, (-1) @ loop back to start

Ap_WmHightLightMap3_anim_1: @ +$54
	.2byte  4,  1

	.2byte 0, (-1) @ loop back to start
.L_end_Ap_WmHightLightMap3:
	.if (.L_end_Ap_WmHightLightMap3 - Ap_WmHightLightMap3) != 92
	.error "Ap_WmHightLightMap3 size mismatch"
	.endif
	.size Ap_WmHightLightMap3, . - Ap_WmHightLightMap3
