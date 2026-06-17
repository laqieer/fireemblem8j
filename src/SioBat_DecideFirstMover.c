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




void SioBat_DecideFirstMover(struct SioBatProc * proc)
{
    u8 buf[0x10];

    PutSioText(0x6d4, 1); // "Please wait..."

    if (gSioSt->selfId == 0)
    {
        proc->unk_3b = GetGameClock() % gLinkArenaSt.unk_A0;
        proc->unk_39 = gLinkArenaSt.unk_A0 * ((AdvanceGetLCGRNValue() & 3) + 4) + proc->unk_3b;

        buf[0] = gLinkArenaSt.unk_ec.unk_0_0;
        buf[1] = gLinkArenaSt.unk_ec.unk_0_2;
        buf[2] = gLinkArenaSt.unk_ec.unk_0_1;
        buf[3] = proc->unk_3b;
        buf[4] = proc->unk_39;

        StoreRNState((void *)buf + 6);

        proc->unk_34 = SioEmitData(buf, sizeof(buf));
    }

    proc->unk_3a = 0;
    proc->unk_38 = 0;

    return;
}
