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

//! FE8U = 0x0804CB94
void LATeamSpriteDraw_Loop(struct LATeamSpriteDrawProc * proc)
{
    int i;
    int j;

    for (i = 0; i < proc->numTeams; i++)
    {
        int y = proc->yBase + i * 16;

        if (y >= proc->yMax)
        {
            continue;
        }

        if (y <= proc->yMin)
        {
            continue;
        }

        for (j = 0; j < 5; j++)
        {
            struct Unit * unit = GetUnit(i * 5 + j + 1);

            if (unit->pCharacterData == NULL)
            {
                continue;
            }

            PutUiUnitSprite(4, proc->xBase + j * 14, y, OAM2_LAYER(1), unit);
        }
    }

    return;
}
