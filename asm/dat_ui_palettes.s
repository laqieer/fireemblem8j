	.section .rodata.dat_ui_palettes, "a", %progbits
@ src/data/ui/ui_palettes.o: region-same content at JP 0x085c7290 (US 0x0859ed70, shift -0x-28520); incbin baserom.gba
	.global gPal_MiscUiGraphics
gPal_MiscUiGraphics:
	.incbin "baserom.gba", 0x5C7290, 0x40
	.global gImg_UiCursorHandTop
gImg_UiCursorHandTop:
	.incbin "baserom.gba", 0x5C72D0, 0x3C
	.global gImg_UiCursorHandBottom
gImg_UiCursorHandBottom:
	.incbin "baserom.gba", 0x5C730C, 0x34
	.global gPal_MapSprite
gPal_MapSprite:
	.incbin "baserom.gba", 0x5C7340, 0x20
	.global unit_icon_pal_enemy
unit_icon_pal_enemy:
	.incbin "baserom.gba", 0x5C7360, 0x20
	.global unit_icon_pal_npc
unit_icon_pal_npc:
	.incbin "baserom.gba", 0x5C7380, 0x20
	.global unit_icon_pal_after_action
unit_icon_pal_after_action:
	.incbin "baserom.gba", 0x5C73A0, 0x20
	.global gPal_MapSpriteArena
gPal_MapSpriteArena:
	.incbin "baserom.gba", 0x5C73C0, 0x20
	.global gPal_LightRune
gPal_LightRune:
	.incbin "baserom.gba", 0x5C73E0, 0x20
	.global gPal_MapSpriteSepia
gPal_MapSpriteSepia:
	.incbin "baserom.gba", 0x5C7400, 0x20
	.global Pal_Text
Pal_Text:
	.incbin "baserom.gba", 0x5C7420, 0x20
	.global Pal_TalkText
Pal_TalkText:
	.incbin "baserom.gba", 0x5C7440, 0x20
	.global Pal_HelpBox
Pal_HelpBox:
	.incbin "baserom.gba", 0x5C7460, 0x20
	.global gPal_HelpTextBox
gPal_HelpTextBox:
	.incbin "baserom.gba", 0x5C7480, 0x20
	.global gPal_YellowTextBox
gPal_YellowTextBox:
	.incbin "baserom.gba", 0x5C74A0, 0x40
	.global Pal_GreenTextColors
Pal_GreenTextColors:
	.incbin "baserom.gba", 0x5C74E0, 0x20
	.global Pal_Text_Inverted
Pal_Text_Inverted:
	.incbin "baserom.gba", 0x5C7500, 0x20
	.global Pal_TalkBubble_Inverted
Pal_TalkBubble_Inverted:
	.incbin "baserom.gba", 0x5C7520, 0x20
