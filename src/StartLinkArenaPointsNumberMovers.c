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

extern struct ProcCmd ProcScr_LinkArena_PointsNumberMover[];
extern struct ProcCmd ProcScr_LinkArena_PointsSpriteText[];

// clang-format on

//! FE8U = 0x080490EC
s8 StartLinkArenaPointsNumberMovers(int x, int y, const char * str, u8 flag, ProcPtr parent)
{
    int i;
    struct Text text;

    int fl = (s8)flag;

    int count = 0;

    ApplyPalette(Pal_Text, 0x19);

    InitSpriteTextFont(&Font_Sio_0, (void *)(0x06016800), 3);

    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);
    ResetTextFont();

    InitSpriteText((struct Text *)0x02000C78); /* gUnk_Sio_1: baseline sym misbound to 0x4645464e */
    SpriteText_DrawBackgroundExt((struct Text *)0x02000C78, 0);

    SetTextFont(NULL);

    for (i = 0; i < 4; i++)
    {
        int playerId = gSioPoints_1[gSioSt->selfId][i];

        if (Sio_IsPlayerConnected(playerId) != 0)
        {
            if (gUnk_Sio_16.unk_2c[playerId].newScore != 0)
            {
                struct PointsNumberMoverProc * proc = Proc_StartBlocking(ProcScr_LinkArena_PointsNumberMover, parent);
                proc->playerId = playerId;
                proc->unitId = gUnk_Sio_16.unk_2c[playerId].unitId;
                proc->newScore = gUnk_Sio_16.currentScore[playerId] + gUnk_Sio_16.unk_2c[playerId].newScore;

                if (proc->newScore > 9999)
                {
                    proc->newScore = 9999;
                }

                proc->difference = proc->newScore - gUnk_Sio_16.currentScore[playerId];
                proc->unk_40 = fl;

                InitTextDb(&proc->text, 4);

                count++;
            }
            else
            {
                InitTextDb(&text, 4);
            }
        }
    }

    if (count != 0)
    {
        if (fl != 0)
        {
            struct PointsSpriteTextProc * proc = Proc_StartBlocking(ProcScr_LinkArena_PointsSpriteText, parent);
            proc->x = x;
            proc->y = y;
            proc->str = str;
        }

        return 1;
    }

    return 0;
}
