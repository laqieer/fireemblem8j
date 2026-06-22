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

void SioBat_WaitSetupAck(struct SioBatProc * proc)
{
    LinkArena_UpdatePlayerStatusText();

    gUnk_Sio_13++;

    if ((gLinkArenaSt.unk_A0 != gSioSt->unk_007) || (gUnk_Sio_13 > 600))
    {
        EndSioProcs();
        SioBat_ReleaseIrq();
        StartSioProcs(proc);

        proc->unk_30 = 0;

        PutSioText(MSG_6D3, 1); /* "Setting up. Please wait..." */
        StartLinkArenaButtonSpriteDraw(192, 16, proc);

        Proc_Goto(proc, 3);

        goto _08046220;
    }
    else if (gSioSt->selfId == 0)
    {
        if ((gSioSt->pendingSend[proc->unk_34].unk_00 & gSioSt->unk_009) == gSioSt->unk_009)
        {
        _08046220:
            Proc_Break(proc);
        }

        return;
    }

    Proc_Break(proc);

    return;
}
