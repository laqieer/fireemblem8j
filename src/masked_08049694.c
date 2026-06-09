#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"

#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"

// clang-format off









// clang-format off



// clang-format on

//! FE8U = 0x08048884
void Sio_SortPlayersByScore(struct SioProc85A971C_Unk44 * buf)
{
    int i;
    int j;

    int r3 = gLinkArenaSt.unk_A0;

    if (gLinkArenaSt.unk_ec.unk_0_1 != 0) // TODO: Survival mode?
    {
        for (i = 0; i < r3; i++)
        {
            buf[i].playerId = gUnk_Sio_16.unk_0F[i];
            buf[i].points = gUnk_Sio_16.currentScore[gUnk_Sio_16.unk_0F[i]];
        }
    }
    else
    {
        for (i = 0; i < r3; i++)
        {
            buf[i].playerId = i;
            buf[i].points = gUnk_Sio_16.currentScore[i];
        }

        for (i = 0; i <= r3 - 2; i++)
        {
            for (j = r3 - 2; j >= i; j--)
            {
                if (buf[j].points < buf[j + 1].points)
                {
                    int tmpPlayerId;
                    int tmpPoints;

                    tmpPlayerId = buf[j].playerId;
                    buf[j].playerId = buf[j + 1].playerId;
                    buf[j + 1].playerId = tmpPlayerId;

                    tmpPoints = buf[j].points;
                    buf[j].points = buf[j + 1].points;
                    buf[j + 1].points = tmpPoints;
                }
            }
        }
    }

    return;
}
