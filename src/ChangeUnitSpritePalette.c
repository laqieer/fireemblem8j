#include "global.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmmap.h"
#include "ekrbattle.h"
#include "bmudisp.h"

extern u16 unit_icon_pal_enemy[];
extern u16 unit_icon_pal_npc[];

void ChangeUnitSpritePalette(u16 packed_pal)
{
    if (IsBattleDeamonActive())
        return;

    ApplyUnitSpritePalettes();

    switch (packed_pal & 0xf) {
    case 2:
        ApplyPalette(unit_icon_pal_enemy, 0x1C);
        break;
    case 3:
        ApplyPalette(unit_icon_pal_npc, 0x1C);
        break;
    case 4:
        ApplyPalette(gPal_MapSpriteSepia, 0x1C);
        break;
    }

    switch ((packed_pal >> 4) & 0xf) {
    case 1:
        ApplyPalette(gPal_MapSprite, 0x1D);
        break;
    case 3:
        ApplyPalette(unit_icon_pal_npc, 0x1D);
        break;
    case 4:
        ApplyPalette(gPal_MapSpriteSepia, 0x1D);
        break;
    }

    switch ((packed_pal >> 8) & 0xf) {
    case 1:
        ApplyPalette(gPal_MapSprite, 0x1E);
        break;
    case 2:
        ApplyPalette(unit_icon_pal_enemy, 0x1E);
        break;
    case 4:
        ApplyPalette(gPal_MapSpriteSepia, 0x1E);
        break;
    }
}
