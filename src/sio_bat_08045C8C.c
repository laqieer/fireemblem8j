#include "global.h"

#include "bmsave.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "scene.h"
#include "hardware.h"
#include "bmlib.h"
#include "face.h"
#include "rng.h"
#include "sioerror.h"

#include "sio.h"
#include "sio_core.h"

#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x08045CEC
void LinkArena_UpdatePlayerStatusText(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        if (gLinkArenaSt.linking_status[i] != gSioSt->playerStatus[i])
        {
            gLinkArenaSt.linking_status[i] = gSioSt->playerStatus[i];

            ClearText(&gLinkArenaSt.texts[i]);
            Text_SetColor(&gLinkArenaSt.texts[i], 0);

            if (gLinkArenaSt.linking_status[i] < 5)
            {
                PutDrawTextCentered(
                    &gLinkArenaSt.texts[i], 11, 5 + i * 3,
                    GetStringFromIndex(gLinkArenaStatusMsg[gLinkArenaSt.linking_status[i]]), 10);
                ApplyPalette(gUnkData_9, 0x13 + i);
            }
            else
            {
                PutDrawTextCentered(&gLinkArenaSt.texts[i], 11, 5 + i * 3, gLinkArenaSt.unk_A1[i], 10);
                ApplyPalette(Pal_TacticianSelObj + 0x10 * i, 0x13 + i);
            }

            BG_EnableSyncByMask(BG0_SYNC_BIT);
        }
    }

    return;
}
