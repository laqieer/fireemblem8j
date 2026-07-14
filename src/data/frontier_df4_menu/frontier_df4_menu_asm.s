@ Descriptive assembly extracted from inline __asm__ + gap5 INCBIN global in frontier_df4_menu.c (#152).
@ Interleaved .incbin + non-4-aligned .4byte function pointers; byte-exact via make compare.
@
@ gap5 (frontier_df4_menu_005_A5FFAD, ROM 0x08A5FFAD..0x08A60138, 0x18B=395 B) is the true
@ floor: layout/carved_rom.d/data_frontier4_df4_menu.tsv's own gap5 row proves the ROM gap
@ ends at 0x08A60138, where already-carved ProcScr_menu148_ref (ProcScr_EventHorizontalQuakefx
@ etc.) picks up. The tracked frontier_df4_menu_005_A5FFAD.bin used to be over-extracted to
@ 587 B (trailing 192 B duplicating that already-carved quakefx tail); trimmed to the true
@ 395 B (issue #143 menu re-audit). RE-complete: a GameOver-sequence proc-script-like leaf,
@ interleaved raw counts/fields + 8 already-relocated ARM function pointers, heavily
@ cross-referenced base+offset from ~80 chapter Events_ref/MapChanges_ref tables (the
@ earlier "MapChanges" label itself was refuted). No further typed structure is discernible
@ without inventing semantics for the un-pointered raw fields; kept as an honest floor.

	.section .data.frontier_df4_menu.gap5, "aw", %progbits
	.global frontier_df4_menu_005_A5FFAD
frontier_df4_menu_005_A5FFAD:
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x0, 0x103
	.section .data.frontier_df4_menu.gap5, "aw", %progbits
	.global data_08A600B0
data_08A600B0:
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x103, 0xC
	.4byte GameOver_FadeOutCurrentBgm
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x113, 0xC
	.4byte StartSlowFadeToBlack
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x123, 0xC
	.4byte EndAllMus
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x133, 0x4
	.4byte SkilGameOverForToturialExtraMap
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x13B, 0x4
	.4byte sub_8021210
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x143, 0x14
	.4byte PostGameOverHandler
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x15B, 0x14
	.4byte AsnycKeyStatus_ButtonB
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x173, 0xC
	.4byte UnsetKeyIgnoreMask
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x183, 0x8
	.section .data.frontier_df4_menu.gap21, "aw", %progbits
	.global frontier_df4_menu_021_A95B4E
frontier_df4_menu_021_A95B4E:
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin", 0x0, 0xE
	.4byte DrawSupportBannerSprites_Init
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin", 0x12, 0x4
	.4byte DrawSupportBannerSprites_Loop
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin", 0x1A, 0x8
	.section .data.frontier_df4_menu.gap27, "aw", %progbits
	.global frontier_df4_menu_027_A9D462
frontier_df4_menu_027_A9D462:
	.incbin "graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin", 0x0, 0x11A
	.4byte Sprite_Savedraw_7 + 0xE
	.4byte Sprite_Savedraw_7 + 0x16
	.4byte Sprite_Savedraw_7 + 0x1E
	.4byte Sprite_Savedraw_7 + 0x26
	.4byte Sprite_Savedraw_7 + 0x2E
	.4byte Sprite_Savedraw_7 + 0x36
	.4byte Sprite_Savedraw_7 + 0x3E
	.4byte Sprite_Savedraw_7 + 0x46
	.4byte Sprite_Savedraw_7 + 0x4E
	.4byte Sprite_Savedraw_7 + 0x56
	.4byte Sprite_Savedraw_7 + 0x5E
	.4byte Sprite_Savedraw_7 + 0x66
	.4byte Sprite_Savedraw_7 + 0x6E
	.4byte Sprite_Savedraw_7 + 0x76
	.4byte Sprite_Savedraw_7 + 0x7E
	.4byte Sprite_Savedraw_7 + 0x86
	.4byte Sprite_Savedraw_7 + 0x8E
	.4byte Sprite_Savedraw_7 + 0x96
	.4byte Sprite_Savedraw_7 + 0x9E
	.4byte Sprite_Savedraw_7 + 0xA6
	.4byte Sprite_Savedraw_7 + 0xAE
	.4byte Sprite_Savedraw_7 + 0xB6
