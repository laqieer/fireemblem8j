#include "global.h"

/* Migrated from asm/dat_ui_palettes.s (region-same graphics, single section).
 * Each symbol kept in the original section in order; byte-identical via INCBIN_U8.
 */

SECTION(".rodata.dat_ui_palettes") u16 gPal_MiscUiGraphics[] = INCBIN_U16("graphics/misc_gfx/gPal_MiscUiGraphics.gbapal");
SECTION(".rodata.dat_ui_palettes") u8 gImg_UiCursorHandTop[] = INCBIN_U8("graphics/misc_gfx/gImg_UiCursorHandTop.bin.lz");
SECTION(".rodata.dat_ui_palettes") u8 gImg_UiCursorHandBottom[] = INCBIN_U8("graphics/misc_gfx/gImg_UiCursorHandBottom.bin.lz");
SECTION(".rodata.dat_ui_palettes") u16 gPal_MapSprite[] = INCBIN_U16("graphics/misc_gfx/gPal_MapSprite.gbapal");
SECTION(".rodata.dat_ui_palettes") u8 unit_icon_pal_enemy[] = INCBIN_U8("graphics/misc_gfx/unit_icon_pal_enemy.gbapal");
SECTION(".rodata.dat_ui_palettes") u8 unit_icon_pal_npc[] = INCBIN_U8("graphics/misc_gfx/unit_icon_pal_npc.gbapal");
SECTION(".rodata.dat_ui_palettes") u8 unit_icon_pal_after_action[] = INCBIN_U8("graphics/misc_gfx/unit_icon_pal_after_action.gbapal");
SECTION(".rodata.dat_ui_palettes") u16 gPal_MapSpriteArena[] = INCBIN_U16("graphics/misc_gfx/gPal_MapSpriteArena.gbapal");
SECTION(".rodata.dat_ui_palettes") u16 gPal_LightRune[] = INCBIN_U16("graphics/misc_gfx/gPal_LightRune.gbapal");
SECTION(".rodata.dat_ui_palettes") u16 gPal_MapSpriteSepia[] = INCBIN_U16("graphics/misc_gfx/gPal_MapSpriteSepia.gbapal");
SECTION(".rodata.dat_ui_palettes") u16 Pal_Text[] = INCBIN_U16("graphics/misc_gfx/Pal_Text.gbapal");
SECTION(".rodata.dat_ui_palettes") u8 Pal_TalkText[] = INCBIN_U8("graphics/misc_gfx/Pal_TalkText.gbapal");
SECTION(".rodata.dat_ui_palettes") u16 Pal_HelpBox[] = INCBIN_U16("graphics/misc_gfx/Pal_HelpBox.gbapal");
SECTION(".rodata.dat_ui_palettes") u16 gPal_HelpTextBox[] = INCBIN_U16("graphics/misc_gfx/gPal_HelpTextBox.gbapal");
SECTION(".rodata.dat_ui_palettes") u16 gPal_YellowTextBox[] = INCBIN_U16("graphics/misc_gfx/gPal_YellowTextBox.gbapal");
SECTION(".rodata.dat_ui_palettes") u16 Pal_GreenTextColors[] = INCBIN_U16("graphics/misc_gfx/Pal_GreenTextColors.gbapal");
SECTION(".rodata.dat_ui_palettes") u16 Pal_Text_Inverted[] = INCBIN_U16("graphics/misc_gfx/Pal_Text_Inverted.gbapal");
SECTION(".rodata.dat_ui_palettes") u16 Pal_TalkBubble_Inverted[] = INCBIN_U16("graphics/misc_gfx/Pal_TalkBubble_Inverted.gbapal");
