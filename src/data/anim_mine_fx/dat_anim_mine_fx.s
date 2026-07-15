@ Descriptive assembly extracted from inline __asm__ in dat_anim_mine_fx.c (#152).
@ Byte-identical to the compiled inline-asm form; make compare is the oracle.

	.section .rodata.dat_anim_mine_fx, "a", %progbits
	.align 2

	.global SpritAnim_MineFx_motion
	.type SpritAnim_MineFx_motion, %object
	.size SpritAnim_MineFx_motion, .L_opaque_extent_end_dat_anim_mine_fx - SpritAnim_MineFx_motion
	SpritAnim_MineFx_motion:
	.2byte (SpritAnim_MineFx_frame_list - SpritAnim_MineFx_motion), (SpritAnim_MineFx_anim_list - SpritAnim_MineFx_motion) @ header

	.global SpritAnim_MineFx_frame_list
	.type SpritAnim_MineFx_frame_list, %object
	.size SpritAnim_MineFx_frame_list, SpritAnim_MineFx_anim_list - SpritAnim_MineFx_frame_list
	SpritAnim_MineFx_frame_list: @ +$4
	.2byte (SpritAnim_MineFx_frame_0 - SpritAnim_MineFx_frame_list)
	.2byte (SpritAnim_MineFx_frame_1 - SpritAnim_MineFx_frame_list)
	.2byte (SpritAnim_MineFx_frame_2 - SpritAnim_MineFx_frame_list)
	.2byte (SpritAnim_MineFx_frame_3 - SpritAnim_MineFx_frame_list)
	.2byte (SpritAnim_MineFx_frame_4 - SpritAnim_MineFx_frame_list)
	.2byte (SpritAnim_MineFx_frame_5 - SpritAnim_MineFx_frame_list)
	.2byte (SpritAnim_MineFx_frame_6 - SpritAnim_MineFx_frame_list)
	.2byte (SpritAnim_MineFx_frame_7 - SpritAnim_MineFx_frame_list)
	.2byte (SpritAnim_MineFx_frame_8 - SpritAnim_MineFx_frame_list)

	.global SpritAnim_MineFx_anim_list
	.type SpritAnim_MineFx_anim_list, %object
	.size SpritAnim_MineFx_anim_list, SpritAnim_MineFx_frame_0 - SpritAnim_MineFx_anim_list
	SpritAnim_MineFx_anim_list: @ +$16
	.2byte (SpritAnim_MineFx_anim_0 - SpritAnim_MineFx_anim_list)

	.global SpritAnim_MineFx_frame_0
	.type SpritAnim_MineFx_frame_0, %object
	.size SpritAnim_MineFx_frame_0, SpritAnim_MineFx_frame_1 - SpritAnim_MineFx_frame_0
	SpritAnim_MineFx_frame_0: @ +$18
	.2byte 1 @ oam entries
	.2byte 0xF8, 0x41F8, 0x0 @ OAM Data #0

	.global SpritAnim_MineFx_frame_1
	.type SpritAnim_MineFx_frame_1, %object
	.size SpritAnim_MineFx_frame_1, SpritAnim_MineFx_frame_2 - SpritAnim_MineFx_frame_1
	SpritAnim_MineFx_frame_1: @ +$20
	.2byte 1 @ oam entries
	.2byte 0xF8, 0x41F8, 0x2 @ OAM Data #0

	.global SpritAnim_MineFx_frame_2
	.type SpritAnim_MineFx_frame_2, %object
	.size SpritAnim_MineFx_frame_2, SpritAnim_MineFx_frame_3 - SpritAnim_MineFx_frame_2
	SpritAnim_MineFx_frame_2: @ +$28
	.2byte 1 @ oam entries
	.2byte 0xF8, 0x41F8, 0x4 @ OAM Data #0

	.global SpritAnim_MineFx_frame_3
	.type SpritAnim_MineFx_frame_3, %object
	.size SpritAnim_MineFx_frame_3, SpritAnim_MineFx_frame_4 - SpritAnim_MineFx_frame_3
	SpritAnim_MineFx_frame_3: @ +$30
	.2byte 1 @ oam entries
	.2byte 0xF8, 0x41F8, 0x6 @ OAM Data #0

	.global SpritAnim_MineFx_frame_4
	.type SpritAnim_MineFx_frame_4, %object
	.size SpritAnim_MineFx_frame_4, SpritAnim_MineFx_frame_5 - SpritAnim_MineFx_frame_4
	SpritAnim_MineFx_frame_4: @ +$38
	.2byte 1 @ oam entries
	.2byte 0xF8, 0x41F8, 0x8 @ OAM Data #0

	.global SpritAnim_MineFx_frame_5
	.type SpritAnim_MineFx_frame_5, %object
	.size SpritAnim_MineFx_frame_5, SpritAnim_MineFx_frame_6 - SpritAnim_MineFx_frame_5
	SpritAnim_MineFx_frame_5: @ +$40
	.2byte 1 @ oam entries
	.2byte 0xF8, 0x41F8, 0xA @ OAM Data #0

	.global SpritAnim_MineFx_frame_6
	.type SpritAnim_MineFx_frame_6, %object
	.size SpritAnim_MineFx_frame_6, SpritAnim_MineFx_frame_7 - SpritAnim_MineFx_frame_6
	SpritAnim_MineFx_frame_6: @ +$48
	.2byte 1 @ oam entries
	.2byte 0xF8, 0x41F8, 0xC @ OAM Data #0

	.global SpritAnim_MineFx_frame_7
	.type SpritAnim_MineFx_frame_7, %object
	.size SpritAnim_MineFx_frame_7, SpritAnim_MineFx_frame_8 - SpritAnim_MineFx_frame_7
	SpritAnim_MineFx_frame_7: @ +$50
	.2byte 1 @ oam entries
	.2byte 0xF7, 0x41F8, 0x0 @ OAM Data #0

	.global SpritAnim_MineFx_frame_8
	.type SpritAnim_MineFx_frame_8, %object
	.size SpritAnim_MineFx_frame_8, SpritAnim_MineFx_anim_0 - SpritAnim_MineFx_frame_8
	SpritAnim_MineFx_frame_8: @ +$58
	.2byte 1 @ oam entries
	.2byte 0xF6, 0x41F8, 0x0 @ OAM Data #0

	.global SpritAnim_MineFx_anim_0
	.type SpritAnim_MineFx_anim_0, %object
	.size SpritAnim_MineFx_anim_0, .L_opaque_extent_end_dat_anim_mine_fx - SpritAnim_MineFx_anim_0
	SpritAnim_MineFx_anim_0: @ +$60
	.2byte  3,  0
	.2byte  3,  7
	.2byte  6,  8
	.2byte  3,  7
	.2byte  2,  0
	.2byte  2,  1
	.2byte  2,  2
	.2byte  2,  3
	.2byte  2,  4
	.2byte  3,  5
	.2byte  3,  6

	.2byte 0, 1 @ kill animated object

	.byte 0x00, 0x00, 0xFF, 0xFF  @ trailing anim data not decoded by apdump
	.global SpritAnim_MineFx
	.type SpritAnim_MineFx, %object
	.size SpritAnim_MineFx, .L_opaque_extent_end_dat_anim_mine_fx - SpritAnim_MineFx
	.set SpritAnim_MineFx, SpritAnim_MineFx_motion
.L_opaque_extent_end_dat_anim_mine_fx:
