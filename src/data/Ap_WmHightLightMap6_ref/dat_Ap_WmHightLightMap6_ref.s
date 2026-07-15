.section .rodata.dat_Ap_WmHightLightMap6_ref, "a", %progbits

@ Ap_WmHightLightMap6: editable AP-motion source for the JP worldmap nation
@ highlight animation (Rausten). Region-different from fe8u
@ src/data/worldmap/anim_worldmap_highlight.s (different OAM frame data, though
@ both are 80 B). Decoded from the JP ROM blob at 0x08B25F9C (was
@ data/residual/Ap_WmHightLightMap6.bin) into the motion->frame_list->anim_list->
@ frames->anims form; byte-identical, verified by `make compare`. The frame
@ `.2byte` words are OAM attr0/attr1/attr2 data, NOT pointers — fully shiftable.

	.global Ap_WmHightLightMap6
	.type Ap_WmHightLightMap6, %object
Ap_WmHightLightMap6:
Ap_WmHightLightMap6_motion:
	.2byte (Ap_WmHightLightMap6_frame_list - Ap_WmHightLightMap6_motion), (Ap_WmHightLightMap6_anim_list - Ap_WmHightLightMap6_motion) @ header

Ap_WmHightLightMap6_frame_list: @ +$4
	.2byte (Ap_WmHightLightMap6_frame_0 - Ap_WmHightLightMap6_frame_list)
	.2byte (Ap_WmHightLightMap6_frame_1 - Ap_WmHightLightMap6_frame_list)

Ap_WmHightLightMap6_anim_list: @ +$8
	.2byte (Ap_WmHightLightMap6_anim_0 - Ap_WmHightLightMap6_anim_list)
	.2byte (Ap_WmHightLightMap6_anim_1 - Ap_WmHightLightMap6_anim_list)

Ap_WmHightLightMap6_frame_0: @ +$C
	.2byte 5 @ oam entries
	.2byte 0x40E4, 0xC1DB, 0x0 @ OAM Data #0
	.2byte 0x80E4, 0x801B, 0x8 @ OAM Data #1
	.2byte 0x80E4, 0x402B, 0xA @ OAM Data #2
	.2byte 0x4004, 0xC1E3, 0xB @ OAM Data #3
	.2byte 0x8004, 0x8023, 0x13 @ OAM Data #4

Ap_WmHightLightMap6_frame_1: @ +$2C
	.2byte 3 @ oam entries
	.2byte 0x40F9, 0x81EA, 0x15 @ OAM Data #0
	.2byte 0xF9, 0x400A, 0x19 @ OAM Data #1
	.2byte 0x80F9, 0x1A, 0x1B @ OAM Data #2

Ap_WmHightLightMap6_anim_0: @ +$40
	.2byte  4,  0

	.2byte 0, (-1) @ loop back to start

Ap_WmHightLightMap6_anim_1: @ +$48
	.2byte  4,  1

	.2byte 0, (-1) @ loop back to start
.L_end_Ap_WmHightLightMap6:
	.if (.L_end_Ap_WmHightLightMap6 - Ap_WmHightLightMap6) != 80
	.error "Ap_WmHightLightMap6 size mismatch"
	.endif
	.size Ap_WmHightLightMap6, . - Ap_WmHightLightMap6
