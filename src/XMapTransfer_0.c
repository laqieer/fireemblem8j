#include "global.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "hardware.h"
#include "bmsave.h"
#include "scene.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "agb_sram.h"
#include "sram-layout.h"
#include "face.h"
#include "event.h"
#include "EAstdlib.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"


bool XMapTransfer_0(ProcPtr proc)
{
    int i;
    u8 buf[4];

    int numTimeouts = 0;

    if (Proc_Find(ProcScr_SIOCON) != NULL)
    {
        if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
        {
            Nop_Scene_0(proc, 4);
            return false;
        }

        return true;
    }

    if ((gSioSt->selfId > 1) || (gSioSt->playerStatus[gSioSt->selfId] == PLAYER_STATUS_2))
    {
        Nop_Scene_0(proc, 0);
        return false;
    }

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->timeoutClock[i] > 60)
        {
            numTimeouts++;
        }
    }

    if (!Sio_CheckLinkAlive() || (gSioSt->unk_01E > 60) || (numTimeouts != 0))
    {
        Nop_Scene_0(proc, 0);
        return false;
    }

    gUnk_73.kind = SIO_MSG_8C;
    gUnk_73.sender = gSioSt->selfId;
    gUnk_73.param = gSioSt->unk_000;
    SioSend(&gUnk_73, 10);

    if ((gSioSt->selfId == 0) && !IsExtraMapAvailable())
    {
        buf[0] = 1;
        SioEmitData(buf, sizeof(buf));
        Nop_Scene_0(proc, 3);
        return false;
    }

    if ((gSioSt->unk_009 & 3) == 3)
    {
        gSioSt->unk_009 = 3;
        SioClearOutgoingQueue();

        gSioSt->unk_004 = 6;
        gSioSt->unk_01E = 0;

        if (gSioSt->selfId != 0)
        {
            Nop_Scene_0(proc, 1);
        }

        return false;
    }

    return true;
}
