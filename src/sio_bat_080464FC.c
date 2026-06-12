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

/* prototypes for same-file helpers called by this run */
void SioBat_PrepareTeamUnit(struct Unit * unit);

//! FE8U = 0x08046580
void SioBat_TeamTransferLoop(struct SioBatProc * proc)
{
    int i;
    u8 buf[0x24];
    u8 outSenderId[4];

    u8 unk = 0;

    if (proc->unk_4c == 0)
    {
        PlaySoundEffect(SONG_7C);
    }

    proc->unk_4c++;

    if (proc->unk_4c > 23)
    {
        proc->unk_4c = 0;
    }

    if (proc->unk_64 < 5)
    {
        proc->unk_58 = (u8)SioEmitData((u8 *)&gSioPostbattle_3->units[proc->unk_64], 0x28);
        proc->unk_64++;
        gLinkArenaSt.linking_status[gSioSt->selfId] = proc->unk_64;
    }

    if ((GetGameClock() % 38) == 0)
    {
        u16 got = SioReceiveData(buf, outSenderId, 0);

        if (got != 0)
        {
            int base = outSenderId[0] * 0x40 + 1;
            struct Unit * unit = GetUnit(base + gLinkArenaSt.linking_status[outSenderId[0]]);

            ClearUnit(unit);
            LoadSavedUnit(buf, unit);
            SioBat_PrepareTeamUnit(unit);

            unit->index = gLinkArenaSt.linking_status[outSenderId[0]] + base;

            if (gLinkArenaSt.linking_status[outSenderId[0]] == 0)
            {
                gUnk_Sio_16.unk_24[outSenderId[0]] = GetUnitMiniPortraitId(unit);
            }

            if (gLinkArenaSt.unk_ec.unk_0_0 == 0)
            {
                unit->state = US_BIT9;
            }

            gLinkArenaSt.linking_status[outSenderId[0]]++;
        }

        for (i = 0; i < 4; i++)
        {
            u8 * ptr = gUnk_Sio_8;

            if ((Sio_IsPlayerConnected(i) != 0) && (ptr[i] < 5))
            {
                unk++;
            }
        }

        if (unk == 0)
        {
            gSioSt->unk_00A = 1 << gSioSt->selfId;
            Proc_Break(proc);
        }
    }

    return;
}
