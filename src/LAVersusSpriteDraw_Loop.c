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
extern const u16 Sprite_SioUiutils_0[];
extern const u16 Sprite_SioUiutils_1[];

// clang-format on

//! FE8U = 0x0804D47C
void LAVersusSpriteDraw_Loop(struct LAVersusSpriteDrawProc * proc)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        PutSprite(4, proc->x, proc->yBase + i * 24, Sprite_LinkArena_NameBanner, OAM2_PAL(i) + OAM2_LAYER(2));

        // clang-format off
        SetObjAffine(
            i,
            Div(+COS(0) * 16, 0x100),
            Div(-SIN(0) * 16, 0x100),
            Div(+SIN(0) * 16, 0x100),
            Div(+COS(0) * 16, 0x100)
        );
        // clang-format on

        if (proc->unk_38 != -1)
        {
            if (proc->unk_38 != i)
            {
                if (proc->unk_3c[i] > 0x100)
                {
                    proc->unk_3c[i] -= 8;
                }

                if (proc->unk_38 == i)
                {
                    goto _0804D544;
                }
            }
            else
            {
            _0804D544:
                if (proc->unk_3c[i] <= 335)
                {
                    proc->unk_3c[i] += 8;
                }
            }

            // clang-format off
            SetObjAffine(
                i,
                Div(+COS(0) * 16, proc->unk_3c[i]),
                Div(-SIN(0) * 16, proc->unk_3c[i]),
                Div(+SIN(0) * 16, proc->unk_3c[i]),
                Div(+COS(0) * 16, proc->unk_3c[i])
            );
            // clang-format on
        }

        PutSprite(4, proc->x - 48, proc->yBase + i * 24, SpriteArray_LAVersusPlayerNumbers[i], 0);
    }

    if (proc->unk_34 != -1)
    {
        PutSprite(4, proc->x - 72, proc->yBase + proc->unk_34 * 24 + 8, Sprite_SioUiutils_0, 0);
        PutSprite(4, proc->x - 72, proc->yBase + proc->unk_34 * 24 + 18, Sprite_SioUiutils_1, 0);
        UpdateLinkArenaVersusBannerGlow();
    }

    return;
}
