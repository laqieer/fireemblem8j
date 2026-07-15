.section .rodata.dat_worldmap_gmapunit_p1601,"aw"

@ AP_DrawPreparationsBanner: editable AP-motion source (JP-only; passed to
@ APProc_Create from the prep-screen "draw funds banner" code, cf fe8u
@ prep_menuproc.c). Decoded from the JP ROM blob at 0x08A97C2C (was
@ data/residual/AP_DrawPreparationsBanner.bin) into the
@ motion->frame_list->anim_list->frame_N(oam)->anim_N tree, the same hand-written
@ form as fe8u src/data/worldmap/anim_worldmap_highlight.s. The frame `.2byte`
@ words are OAM attr0/attr1/attr2 data, NOT pointers -> fully shiftable.
@ Byte-identical to the ROM, verified by `make compare`.

	.global AP_DrawPreparationsBanner
	.type AP_DrawPreparationsBanner, %object
	.size AP_DrawPreparationsBanner, Img_PrepFunds - AP_DrawPreparationsBanner
AP_DrawPreparationsBanner:
AP_DrawPreparationsBanner_motion:
	.2byte (AP_DrawPreparationsBanner_frame_list - AP_DrawPreparationsBanner_motion), (AP_DrawPreparationsBanner_anim_list - AP_DrawPreparationsBanner_motion) @ header

AP_DrawPreparationsBanner_frame_list: @ +$4
	.2byte (AP_DrawPreparationsBanner_frame_0 - AP_DrawPreparationsBanner_frame_list)
	.2byte (AP_DrawPreparationsBanner_frame_1 - AP_DrawPreparationsBanner_frame_list)
	.2byte (AP_DrawPreparationsBanner_frame_2 - AP_DrawPreparationsBanner_frame_list)

AP_DrawPreparationsBanner_anim_list: @ +$A
	.2byte (AP_DrawPreparationsBanner_anim_0 - AP_DrawPreparationsBanner_anim_list)
	.2byte (AP_DrawPreparationsBanner_anim_1 - AP_DrawPreparationsBanner_anim_list)

AP_DrawPreparationsBanner_frame_0: @ +$E
	.2byte 3 @ oam entries
	.2byte 0x40F0, 0xC1C8, 0x1000 @ OAM Data #0
	.2byte 0xF0, 0x8008, 0x1008 @ OAM Data #1
	.2byte 0x80F0, 0x8028, 0x100C @ OAM Data #2

AP_DrawPreparationsBanner_frame_1: @ +$22
	.2byte 6 @ oam entries
	.2byte 0x80F0, 0x81C8, 0x1000 @ OAM Data #0
	.2byte 0x80F0, 0x41D8, 0x1002 @ OAM Data #1
	.2byte 0xF0, 0x81E0, 0x100E @ OAM Data #2
	.2byte 0x80F0, 0x8000, 0x1012 @ OAM Data #3
	.2byte 0xF0, 0x8010, 0x1009 @ OAM Data #4
	.2byte 0x80F0, 0x4030, 0x100D @ OAM Data #5

AP_DrawPreparationsBanner_frame_2: @ +$48
	.2byte 1 @ oam entries
	.2byte 0x40F0, 0xC1E0, 0x2018 @ OAM Data #0

AP_DrawPreparationsBanner_anim_0: @ +$50
	.2byte  1,  0
	.2byte  0,  0
	.2byte 0, (-1) @ loop back to start

AP_DrawPreparationsBanner_anim_1: @ +$5C
	.2byte  1,  1
	.2byte  0,  0
	.2byte 0, (-1) @ loop back to start
.L_end_AP_DrawPreparationsBanner:
	.if (.L_end_AP_DrawPreparationsBanner - AP_DrawPreparationsBanner) != 104
	.error "AP_DrawPreparationsBanner size mismatch"
	.endif

	.global Img_PrepFunds
	.type Img_PrepFunds, %object
	.size Img_PrepFunds, .L_opaque_extent_end_dat_worldmap_gmapunit_p1601 - Img_PrepFunds
Img_PrepFunds:
	.incbin "graphics/gmapunit/Img_PrepFunds.4bpp.lz"
.L_opaque_extent_end_dat_worldmap_gmapunit_p1601:
