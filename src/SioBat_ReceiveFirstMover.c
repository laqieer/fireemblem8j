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




void SioBat_ReceiveFirstMover(struct SioBatProc * proc)
{
    u16 got;
    struct SioBatProc_Unk2C * unk_2c;
    u8 buf[16];
    u8 outSenderId[4];

    unk_2c = proc->unk_2c;

    if (gSioSt->selfId == 0)
    {
        if (gSioSt->pendingSend[proc->unk_34].unk_00 == gSioSt->unk_009)
        {
            PutSioText(0x6d9, 1); // "Select player to move first."
            unk_2c->unk_38 = 0;
            Proc_Break(proc);
        }
    }
    else
    {
        if ((GetGameClock() % 38) == 0)
        {
            got = SioReceiveData(buf, outSenderId, NULL);

            if (got != 0)
            {
                struct LinkArenaStMaybe * las = &gLinkArenaSt;
                u8 * buf2 = buf;
                struct LinkArenaStMaybe_ec * unk_ec = &las->unk_ec;

                // clang-format off
                { u32 r4 = 1; ++r4; --r4; }
                // clang-format on

                unk_ec->unk_0_0 = buf2[0] % 2;
                unk_ec->unk_0_2 = buf[1] % 2;
                unk_ec->unk_0_1 = buf[2] % 2;

                proc->unk_3b = buf[3];
                proc->unk_39 = buf[4];
                LoadRNState((void *)(buf + 6));
                PutSioText(0x6d9, 1); // "Select player to move first."
                unk_2c->unk_38 = 0;
                Proc_Break(proc);
            }
        }
    }

    return;
}
