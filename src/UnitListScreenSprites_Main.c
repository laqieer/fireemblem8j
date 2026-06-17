#include "global.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "statscreen.h"
#include "mu.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "constants/songs.h"



void UnitListScreenSprites_Main(struct UnitListScreenSpritesProc * proc)
{
    int i;
    int r7;
    int r8;

    int gUnknown_08205B84[4] =
    {
        0, 1, 2, 1,
    };

    PutSpriteExt(
        0xb, (proc->unk_2c->unk_34 == 0) ? 226 : 226 + OAM1_VFLIP, gUnknown_08205B84[(proc->unk_3b / 8) % 4] + 7, Sprite_Unitlistscreen_3,
        OAM2_PAL(9));

    PutSpriteExt(0xd, 0x10, 8, gSpriteArray_Unitlistscreen_1[proc->unk_2c->page], OAM2_PAL(9));

    UpdateMenuScrollBarConfig(10, proc->unk_2c->unk_3e, gUnitlistscreen_8, 6);

    if (proc->unk_2c->unk_29 >= 3)
    {
        DisplayUiHand(
            gUnitListScreenFields[proc->unk_2c->page][proc->unk_2c->unk_2d].xColumn, proc->unk_2c->unk_2c * 16 + 40);
    }
    else
    {
        PutSpriteExt(0xd, 4, proc->unk_2c->unk_2c * 16 + 0x40, Sprite_Unitlistscreen_4, OAM2_PAL(9));
    }

    if ((proc->unk_38 != proc->unk_2c->unk_3e) || ((proc->unk_2c->unk_3e % 0x10) != 0))
    {
        gPaletteBuffer[0x19E] = _gUnknown_02013460->unk_10;
        EnablePaletteSync();

        proc->unk_3c = 32;
        proc->unk_38 = proc->unk_2c->unk_3e;

        if (proc->unk_3a == 0)
        {
            UnitList_SetMuralWindow(1);
            proc->unk_3a = 1;
        }
    }
    else
    {
        gPaletteBuffer[0x19E] = _gUnknown_02013460->unk_00[(proc->unk_3c / 4) & 0xf];
        EnablePaletteSync();

        if (proc->unk_3a == 1)
        {
            UnitList_SetMuralWindow(0);
            proc->unk_3a = 0;
        }
    }

    SyncUnitSpriteSheet();

    r7 = (proc->unk_38 / 0x10);
    r8 = -((proc->unk_38) % 0x10);

    for (i = 0; i < 6 && i + r7 < gUnitlistscreen_8; i++)
    {
        PutUnitSprite(4, 8, 56 + i * 16 + r8, gSortedUnits[i + r7]->unit);
    }

    if ((proc->unk_3a != 0) && ((i + r7) < gUnitlistscreen_8))
    {
        PutUnitSprite(4, 8, 56 + i * 16 + r8, gSortedUnits[i + r7]->unit);
    }

    if ((gKeyStatusPtr->newKeys & 0x20) != 0)
    {
        proc->unk_46 = 0x1f;
        proc->unk_3e = 1;
    }

    if ((gKeyStatusPtr->newKeys & 0x10) != 0)
    {
        proc->unk_48 = 0x1f;
        proc->unk_40 = 0xe7;
    }

    proc->unk_42 += proc->unk_46;
    proc->unk_44 += proc->unk_48;

    if (proc->unk_46 > 4)
    {
        proc->unk_46--;
    }

    if (proc->unk_48 > 4)
    {
        proc->unk_48--;
    }

    if ((GetGameClock() & 3) == 0)
    {
        if (proc->unk_3e < 7)
        {
            proc->unk_3e++;
        }

        if (proc->unk_40 > 225)
        {
            proc->unk_40--;
        }
    }

    if ((proc->unk_2c->page > 1) && (proc->unk_2c->mode != UNITLIST_MODE_SOLOANIM))
    {
        PutSprite(0, proc->unk_3e, 40, gObject_8x8, (((u16)proc->unk_42 >> 5) % 6) + OAM2_CHR(0x14) + OAM2_LAYER(1) + OAM2_PAL(1));
        PutSprite(0, proc->unk_3e, 48, gObject_8x8, (((u16)proc->unk_42 >> 5) % 6) + OAM2_CHR(0x1A) + OAM2_LAYER(1) + OAM2_PAL(1));
    }

    if ((proc->unk_2c->page < proc->unk_2c->unk_2e) && (proc->unk_2c->mode != UNITLIST_MODE_SOLOANIM))
    {
        PutSprite(0, proc->unk_40, 40, gObject_8x8_HFlipped, (((u16)proc->unk_44 >> 5) % 6) + OAM2_CHR(0x14) + OAM2_LAYER(1) + OAM2_PAL(1));
        PutSprite(0, proc->unk_40, 48, gObject_8x8_HFlipped, (((u16)proc->unk_44 >> 5) % 6) + OAM2_CHR(0x1A) + OAM2_LAYER(1) + OAM2_PAL(1));
    }

    proc->unk_3b++;
    proc->unk_3c++;

    return;
}
