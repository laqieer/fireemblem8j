#include "global.h"
#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern const u16 Sprite_LinkArena_PressStart[];
extern u16 gUnkData_75[];

//! FE8U = 0x0804C894
void SioTeamMenuSpriteDraw_Loop(struct SioProc85AAA78 * proc)
{
    int i;
    int oam2;

    if (gLinkArenaSt.unk_00 == 1)
    {
        if (proc->unk_44 != 0)
        {
            oam2 = OAM2_LAYER(1);
        }
        else
        {
            oam2 = OAM2_LAYER(3);
        }

        // Put "Team Name" sprite
        PutSprite(0, 88, 32, Sprite_LinkArena_TeamName, 0);

        for (i = 0; i < proc->unk_2c; i++)
        {
            // Put name banner sprite
            PutSprite(4, proc->unk_30[i] + 6, 32 + i * 24, Sprite_LinkArena_NameBanner, OAM2_PAL(i) + oam2);

            if (proc->unk_3a[i] != 0)
            {
                // Put active selection sprite
                PutSprite(4, proc->unk_30[i] + 6, 32 + i * 24, gSioUiutils_4, oam2);
            }
        }

        if (proc->unk_40 != 0)
        {
            if (gUnk_Sio_22 == 0)
            {
                PAL_OBJ_COLOR(8, 14) = ((GetGameClock() % 0x40) / 4)[gUnkData_75];
                EnablePaletteSync();
            }

            if (proc->unk_40 < 0x100)
            {
                proc->unk_40 += 0x10;
            }

            // clang-format off
            SetObjAffine(
                0,
                Div(+COS(0) * 16, 0x100),
                Div(-SIN(0) * 16, proc->unk_40),
                Div(+SIN(0) * 16, 0x100),
                Div(+COS(0) * 16, proc->unk_40)
            );
            // clang-format on

            // Put "Press Start" sprite
            PutSprite(4, 120, 0, Sprite_LinkArena_PressStart, OAM2_PAL(8));
        }

        UpdateLinkArenaNameBannerGlow();
    }
    else
    {
        // Put "Team Name" sprite
        PutSprite(0xb, 88, 32, Sprite_LinkArena_TeamName, 0);

        for (i = 0; i < proc->unk_2c; i++)
        {
            // Put side menu item sprite
            PutSprite(2, proc->unk_30[i], 48 + i * 16, gSioUiutils_3[proc->unk_3a[i]], 0);

            if (proc->unk_3a[i] != 0)
            {
                if (proc->unk_30[i] < 0)
                {
                    proc->unk_30[i]++;
                }
            }
            else if (proc->unk_30[i] > -8)
            {
                proc->unk_30[i]--;
            }
        }

        UpdateLinkArenaSideMenuGlow();
    }

    if (gLinkArenaSt.unk_00 == 1)
    {
        oam2 = OAM2_LAYER(1);
    }
    else
    {
        oam2 = OAM2_LAYER(2);
    }

    if (proc->unk_44 != 0)
    {
        PutLinkArenaButtonSpriteAt(192, 16);
    }

    if (proc->unk_48 >= 0)
    {
        // Put team row highlight indicator sprite
        PutSprite(4, 80, proc->unk_48 + 8, gSioUiutils_2, oam2);
    }

    return;
}
