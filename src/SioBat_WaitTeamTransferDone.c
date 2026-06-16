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


void SioBat_WaitTeamTransferDone(struct SioBatProc * proc)
{
    if (proc->unk_4c == 0)
    {
        PlaySoundEffect(SONG_7C);
    }

    proc->unk_4c++;

    if (proc->unk_4c > 23)
    {
        proc->unk_4c = 0;
    }

    gUnk_Sio_13++;

    if (gUnk_Sio_13 > 600)
    {
        StartSioErrorScreen();
    }

    gSioMsgBuf.kind = SIO_MSG_89;
    gSioMsgBuf.sender = gSioSt->selfId;
    gSioMsgBuf.param = 0;

    SioSend(&gSioMsgBuf, sizeof(gSioMsgBuf));

    if ((gSioSt->pendingSend[proc->unk_58].unk_00 == gSioSt->unk_009) &&
        ((gSioSt->unk_00A & gSioSt->unk_009) == gSioSt->pendingSend[proc->unk_58].unk_00))
    {
        Proc_EndEach(gSioMain_0);
        Proc_Break(proc);
    }

    return;
}
