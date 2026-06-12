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
/* TU-private data externs bound at their JP addresses */
extern const u8 gSioPoints_3[];

void DrawLinkArenaPointsBox(struct Text * th, int x, int y, int var, int number);

//! FE8U = 0x08048988
void LAPointsBox_LoadBoxes(struct LAPointsBoxProc * proc)
{
    int i;
    int oam2;

    Decompress(gUnkData_8, (void *)(0x06002800));
    ApplyPalettes(Pal_TacticianSelObj, 2, 4);

    SetTextFont(NULL);
    ResetTextFont();

    for (i = 0; i < 4; i++)
    {
        int playerId = gSioPoints_0[gSioSt->selfId][i];

        if (Sio_IsPlayerConnected(playerId) != 0)
        {
            if (gUnk_Sio_16.unk_0A[playerId] == 0)
            {
                ApplyPalette(gUnkData_9, playerId + 2);
            }

            oam2 = 0x140 + OAM2_PAL(playerId + 2);

            InitTextDb(&proc->text[i], 4);
            DrawLinkArenaPointsBox(
                &proc->text[i], gSioPoints_3[i * 2 + 0], gSioPoints_3[i * 2 + 1], oam2,
                gUnk_Sio_16.currentScore[playerId]);
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}
