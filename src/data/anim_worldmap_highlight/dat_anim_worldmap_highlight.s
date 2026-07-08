@ Descriptive assembly extracted from inline __asm__ in dat_anim_worldmap_highlight.c (#152).
@ Byte-identical to the compiled inline-asm form; make compare is the oracle.

	.section .rodata.dat_anim_worldmap_highlight, "a", %progbits
	.align 2
	.global Pal_WmHighLightNationMap
	Pal_WmHighLightNationMap:  @ 0x08B23F00
	.incbin "graphics/misc_gfx3/Pal_WmHighLightNationMap.gbapal"

	.global Img_WmHightLightMapFrecia
	Img_WmHightLightMapFrecia:
	.incbin "graphics/misc_gfx3/Img_WmHightLightMapFrecia.4bpp.lz"

	.global Ap_WmHightLightMapFrecia_motion
	Ap_WmHightLightMapFrecia_motion:
	.2byte (Ap_WmHightLightMapFrecia_frame_list - Ap_WmHightLightMapFrecia_motion), (Ap_WmHightLightMapFrecia_anim_list - Ap_WmHightLightMapFrecia_motion) @ header

	.global Ap_WmHightLightMapFrecia_frame_list
	Ap_WmHightLightMapFrecia_frame_list: @ +$4
	.2byte (Ap_WmHightLightMapFrecia_frame_0 - Ap_WmHightLightMapFrecia_frame_list)
	.2byte (Ap_WmHightLightMapFrecia_frame_1 - Ap_WmHightLightMapFrecia_frame_list)

	.global Ap_WmHightLightMapFrecia_anim_list
	Ap_WmHightLightMapFrecia_anim_list: @ +$8
	.2byte (Ap_WmHightLightMapFrecia_anim_0 - Ap_WmHightLightMapFrecia_anim_list)
	.2byte (Ap_WmHightLightMapFrecia_anim_1 - Ap_WmHightLightMapFrecia_anim_list)

	.global Ap_WmHightLightMapFrecia_frame_0
	Ap_WmHightLightMapFrecia_frame_0: @ +$C
	.2byte 10 @ oam entries
	.2byte 0x40DF, 0xC1C9, 0x0 @ OAM Data #0
	.2byte 0xDF, 0x8009, 0x8 @ OAM Data #1
	.2byte 0x40FF, 0xC1D1, 0xE @ OAM Data #2
	.2byte 0x401F, 0x81D9, 0x1A @ OAM Data #3
	.2byte 0x801F, 0x1F9, 0x1E @ OAM Data #4
	.2byte 0x40FF, 0x8011, 0x16 @ OAM Data #5
	.2byte 0xEF, 0x4029, 0x4C @ OAM Data #6
	.2byte 0xE7, 0x29, 0x2C @ OAM Data #7
	.2byte 0xF, 0x11, 0xC @ OAM Data #8
	.2byte 0x1F, 0x1D1, 0x1F @ OAM Data #9

	.global Ap_WmHightLightMapFrecia_frame_1
	Ap_WmHightLightMapFrecia_frame_1: @ +$4A
	.2byte 3 @ oam entries
	.2byte 0x40F9, 0x81E6, 0x56 @ OAM Data #0
	.2byte 0xF9, 0x4006, 0x5A @ OAM Data #1
	.2byte 0x80F9, 0x16, 0x5C @ OAM Data #2

	.global Ap_WmHightLightMapFrecia_anim_0
	Ap_WmHightLightMapFrecia_anim_0: @ +$5E
	.2byte  4,  0

	.2byte 0, (-1) @ loop back to start

	.global Ap_WmHightLightMapFrecia_anim_1
	Ap_WmHightLightMapFrecia_anim_1: @ +$66
	.2byte  4,  1

	.2byte 0, (-1) @ loop back to start

	.byte 0x00, 0x00  @ trailing anim data not decoded by apdump

	.global Img_WmHightLightMap2
	Img_WmHightLightMap2:
	.incbin "graphics/misc_gfx3/Img_WmHightLightMap2.4bpp.lz"

	.global Ap_WmHightLightMap2_motion
	Ap_WmHightLightMap2_motion:
	.2byte (Ap_WmHightLightMap2_frame_list - Ap_WmHightLightMap2_motion), (Ap_WmHightLightMap2_anim_list - Ap_WmHightLightMap2_motion) @ header

	.global Ap_WmHightLightMap2_frame_list
	Ap_WmHightLightMap2_frame_list: @ +$4
	.2byte (Ap_WmHightLightMap2_frame_0 - Ap_WmHightLightMap2_frame_list)
	.2byte (Ap_WmHightLightMap2_frame_1 - Ap_WmHightLightMap2_frame_list)

	.global Ap_WmHightLightMap2_anim_list
	Ap_WmHightLightMap2_anim_list: @ +$8
	.2byte (Ap_WmHightLightMap2_anim_0 - Ap_WmHightLightMap2_anim_list)
	.2byte (Ap_WmHightLightMap2_anim_1 - Ap_WmHightLightMap2_anim_list)

	.global Ap_WmHightLightMap2_frame_0
	Ap_WmHightLightMap2_frame_0: @ +$C
	.2byte 41 @ oam entries
	.2byte 0x40F8, 0x81B7, 0x40 @ OAM Data #0
	.2byte 0xF8, 0x41F7, 0x48 @ OAM Data #1
	.2byte 0x80F8, 0x27, 0x9 @ OAM Data #2
	.2byte 0x4018, 0x41CF, 0x50 @ OAM Data #3
	.2byte 0x4018, 0x81EF, 0x54 @ OAM Data #4
	.2byte 0x4018, 0x800F, 0x58 @ OAM Data #5
	.2byte 0x4008, 0x81B7, 0x10 @ OAM Data #6
	.2byte 0x4008, 0x81D7, 0x14 @ OAM Data #7
	.2byte 0x8, 0x403F, 0x1E @ OAM Data #8
	.2byte 0x40D8, 0x81BF, 0x18 @ OAM Data #9
	.2byte 0xD8, 0x41DF, 0x1C @ OAM Data #10
	.2byte 0x40E0, 0x41EF, 0x70 @ OAM Data #11
	.2byte 0xC8, 0x41D7, 0x4A @ OAM Data #12
	.2byte 0xE8, 0x41D7, 0x4 @ OAM Data #13
	.2byte 0xE8, 0x41E7, 0x6 @ OAM Data #14
	.2byte 0xE8, 0x4007, 0xA @ OAM Data #15
	.2byte 0xE8, 0x4017, 0xC @ OAM Data #16
	.2byte 0x40F0, 0x27, 0x2E @ OAM Data #17
	.2byte 0xE8, 0x41F7, 0x6 @ OAM Data #18
	.2byte 0xF8, 0x4007, 0x6 @ OAM Data #19
	.2byte 0xF8, 0x4017, 0x6 @ OAM Data #20
	.2byte 0x80E8, 0x1BF, 0x1 @ OAM Data #21
	.2byte 0xF0, 0x1B7, 0x20 @ OAM Data #22
	.2byte 0xE8, 0x41C7, 0x2 @ OAM Data #23
	.2byte 0x8, 0x41FF, 0x6 @ OAM Data #24
	.2byte 0x8, 0x400F, 0x6 @ OAM Data #25
	.2byte 0x8, 0x401F, 0x6 @ OAM Data #26
	.2byte 0x8, 0x402F, 0x6 @ OAM Data #27
	.2byte 0x18, 0x402F, 0x5C @ OAM Data #28
	.2byte 0x8018, 0x3F, 0x5E @ OAM Data #29
	.2byte 0x18, 0x47, 0x5F @ OAM Data #30
	.2byte 0xF0, 0x37, 0x7F @ OAM Data #31
	.2byte 0xF8, 0x402F, 0x4C @ OAM Data #32
	.2byte 0x4000, 0x3F, 0x6E @ OAM Data #33
	.2byte 0xF8, 0x3F, 0x4E @ OAM Data #34
	.2byte 0x18, 0x1C7, 0xE @ OAM Data #35
	.2byte 0xD0, 0x1CF, 0xF @ OAM Data #36
	.2byte 0x8008, 0x1F7, 0x8 @ OAM Data #37
	.2byte 0xF8, 0x41E7, 0x46 @ OAM Data #38
	.2byte 0x40F8, 0x1D7, 0x44 @ OAM Data #39
	.2byte 0x4028, 0x2F, 0x64 @ OAM Data #40

	.global Ap_WmHightLightMap2_frame_1
	Ap_WmHightLightMap2_frame_1: @ +$104
	.2byte 6 @ oam entries
	.2byte 0x40F9, 0x41E7, 0x80 @ OAM Data #0
	.2byte 0x40F9, 0x7, 0x84 @ OAM Data #1
	.2byte 0xF9, 0x17, 0x86 @ OAM Data #2
	.2byte 0x4001, 0x41E7, 0x87 @ OAM Data #3
	.2byte 0x4001, 0x7, 0x8B @ OAM Data #4
	.2byte 0x1, 0x17, 0x8D @ OAM Data #5

	.global Ap_WmHightLightMap2_anim_0
	Ap_WmHightLightMap2_anim_0: @ +$12A
	.2byte  4,  0

	.2byte 0, (-1) @ loop back to start

	.global Ap_WmHightLightMap2_anim_1
	Ap_WmHightLightMap2_anim_1: @ +$132
	.2byte  4,  1

	.2byte 0, (-1) @ loop back to start

	.byte 0x00, 0x00  @ trailing anim data not decoded by apdump
	.global Ap_WmHightLightMapFrecia
	.set Ap_WmHightLightMapFrecia, Ap_WmHightLightMapFrecia_motion
	.global Ap_WmHightLightMap2
	.set Ap_WmHightLightMap2, Ap_WmHightLightMap2_motion
