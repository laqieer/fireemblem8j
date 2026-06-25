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

//! FE8U = 0x08045F38
void SioBat_SetupLoop(struct SioBatProc * proc)
{
    int i;
    u8 buf[4];
    u8 recvBuf[4];

    int timeouts = 0;
    u16 got = 0;
    struct SioBatProc_Unk2C * unk_2c = proc->unk_2c;

    gUnk_Sio_13 = 0;
    buf[0] = 0;

    LinkArena_UpdatePlayerStatusText();

    if (Proc_Find(ProcScr_SIOCON) != NULL)
    {
        if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
        {
            SioPlaySoundEffect(1);
            EndLinkArenaButtonSpriteDraw();
            EndSioProcs();
            SioBat_ReleaseIrq();
            Proc_Goto(proc, 2);
        }

        return;
    }

    // JP (earlier build): the success branches below do not each call
    // EndLinkArenaButtonSpriteDraw(); instead it is hoisted here unconditionally.
    EndLinkArenaButtonSpriteDraw();

    unk_2c->unk_34 = gSioSt->selfId;

    for (i = 0; i < 4; i++)
    {
        if (gSioSt->timeoutClock[i] > 60)
        {
            timeouts++;
        }
    }

    if (gSioSt->playerStatus[gSioSt->selfId] == 2)
    {
        EndSioProcs();
        SioBat_ReleaseIrq();
        Proc_Goto(proc, 2);
        return;
    }

    if ((Sio_CheckLinkAlive() == 0) || (gSioSt->unk_01E > 60) || (timeouts != 0))
    {
        EndSioProcs();
        SioBat_ReleaseIrq();
        StartSioProcs(proc);
        proc->unk_30 = 0;
        PutSioText(0x6D3, 1); // JP earlier-build msgid (US MSG_748) "Setting up. Please wait..."
        StartLinkArenaButtonSpriteDraw(192, 16, proc);
        return;
    }

    if ((gSioSt->selfId == 0) && (Sio_AreAllPlayersReady() == 1))
    {
        if (proc->unk_30 != 2)
        {
            proc->unk_30 = 2;
            PutSioText(0x6D5, 1); // JP earlier-build msgid (US MSG_74A) "Press START to begin."
        }

        if ((gKeyStatusPtr->newKeys & START_BUTTON) != 0)
        {
            gSioSt->unk_004 = 6;
            gSioSt->unk_01E = 0;

            for (i = 0; i < 4; i++)
            {
                gSioSt->timeoutClock[i] = 0;
            }

            SioPlaySoundEffect(2);

            gSioSt->unk_007 = Sio_CountConnectedPlayers();
            gLinkArenaSt.unk_A0 = gSioSt->unk_007;
            SioClearOutgoingQueue();

            buf[0] = 0x18;
            proc->unk_34 = SioEmitData(buf, 4);

            Proc_Break(proc);
            return;
        }
    }
    else if (proc->unk_30 != 1)
    {
        proc->unk_30 = 1;
        PutSioText(0x6D4, 1); // JP earlier-build msgid (US MSG_749) "Please wait..."
    }

    if (((gSioSt->selfId != 0) && (Sio_IsPlayerConnected(gSioSt->selfId) != 0)))
    {
        got = SioReceiveData(buf, recvBuf, 0);
        if (got != 0)
        {
            gSioSt->unk_004 = 6;
            gSioSt->unk_01E = 0;

            for (i = 0; i < 4; i++)
            {
                gSioSt->timeoutClock[i] = 0;
            }

            gSioSt->unk_007 = Sio_CountConnectedPlayers();
            gLinkArenaSt.unk_A0 = gSioSt->unk_007;

            SioClearOutgoingQueue();
            Proc_Break(proc);
            return;
        }
    }

    if ((GetGameClock() % 38) != 0)
    {
        return;
    }

    gUnk_73.kind = SIO_MSG_8C;
    gUnk_73.sender = gSioSt->selfId;
    gUnk_73.param = gSioSt->unk_000;

    SioSend(&gUnk_73, 0x16);

    return;
}
