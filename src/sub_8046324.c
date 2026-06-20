#include "global.h"
#include "bmsave.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "sio.h"
#include "sio_core.h"
#include "constants/songs.h"
#include "constants/msg.h"

//! FE8U = 0x080463A8
void SioBat_FirstMoverRoulette(struct SioBatProc * proc)
{
    struct SioBatProc_Unk2C * unk_2c = proc->unk_2c;

    proc->unk_38++;

    if (proc->unk_38 > 16)
    {
        proc->unk_38 = 0;
        proc->unk_3a++;
        proc->unk_3a = proc->unk_3a % gLinkArenaSt.unk_A0;
        proc->unk_39--;
        unk_2c->unk_38 = proc->unk_3a;

        PlaySoundEffect(SONG_7D);

        if (proc->unk_39 == 0)
        {
            if (proc->unk_3b != gSioSt->selfId)
            {
                PutSioText(0x6DB + proc->unk_3b, 1); // "P# moves first."
            }
            else
            {
                PutSioText(0x6DA, 1); // "You move first."
            }

            unk_2c->unk_38 = proc->unk_3b;

            gUnk_Sio_16.unk_00 = proc->unk_3b;
            Proc_Break(proc);
        }
    }

    return;
}
