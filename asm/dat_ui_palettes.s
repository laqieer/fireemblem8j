	.section .rodata.dat_ui_palettes, "a", %progbits
@ src/data/ui/ui_palettes.o: region-same content at JP 0x085c7290 (US 0x0859ed70, shift -0x-28520); incbin baserom.gba
	.global gPal_MiscUiGraphics
gPal_MiscUiGraphics:
	.incbin "graphics/misc_gfx/gPal_MiscUiGraphics.gbapal"
	.global gImg_UiCursorHandTop
gImg_UiCursorHandTop:
	.incbin "graphics/misc_gfx/gImg_UiCursorHandTop.bin.lz"
	.global gImg_UiCursorHandBottom
gImg_UiCursorHandBottom:
	.incbin "graphics/misc_gfx/gImg_UiCursorHandBottom.bin.lz"
	.global gPal_MapSprite
gPal_MapSprite:
	.incbin "graphics/misc_gfx/gPal_MapSprite.gbapal"
	.global unit_icon_pal_enemy
unit_icon_pal_enemy:
	.incbin "graphics/misc_gfx/unit_icon_pal_enemy.gbapal"
	.global unit_icon_pal_npc
unit_icon_pal_npc:
	.incbin "graphics/misc_gfx/unit_icon_pal_npc.gbapal"
	.global unit_icon_pal_after_action
unit_icon_pal_after_action:
	.incbin "graphics/misc_gfx/unit_icon_pal_after_action.gbapal"
	.global gPal_MapSpriteArena
gPal_MapSpriteArena:
	.incbin "graphics/misc_gfx/gPal_MapSpriteArena.gbapal"
	.global gPal_LightRune
gPal_LightRune:
	.incbin "graphics/misc_gfx/gPal_LightRune.gbapal"
	.global gPal_MapSpriteSepia
gPal_MapSpriteSepia:
	.incbin "graphics/misc_gfx/gPal_MapSpriteSepia.gbapal"
	.global Pal_Text
Pal_Text:
	.incbin "graphics/misc_gfx/Pal_Text.gbapal"
	.global Pal_TalkText
Pal_TalkText:
	.incbin "graphics/misc_gfx/Pal_TalkText.gbapal"
	.global Pal_HelpBox
Pal_HelpBox:
	.incbin "graphics/misc_gfx/Pal_HelpBox.gbapal"
	.global gPal_HelpTextBox
gPal_HelpTextBox:
	.incbin "graphics/misc_gfx/gPal_HelpTextBox.gbapal"
	.global gPal_YellowTextBox
gPal_YellowTextBox:
	.incbin "graphics/misc_gfx/gPal_YellowTextBox.gbapal"
	.global Pal_GreenTextColors
Pal_GreenTextColors:
	.incbin "graphics/misc_gfx/Pal_GreenTextColors.gbapal"
	.global Pal_Text_Inverted
Pal_Text_Inverted:
	.incbin "graphics/misc_gfx/Pal_Text_Inverted.gbapal"
	.global Pal_TalkBubble_Inverted
Pal_TalkBubble_Inverted:
	.incbin "graphics/misc_gfx/Pal_TalkBubble_Inverted.gbapal"
