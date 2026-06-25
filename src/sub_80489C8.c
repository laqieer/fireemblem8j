#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "sio.h"
#include "sio_core.h"
#include "gba/multiboot.h"

extern struct MultiBootParam gMultiBootParam;
extern const u8 * gMultiBootImagep;
extern int gMultiBootImageSize;

struct MultiBootSendProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 state;
};

#define mp (&gMultiBootParam)

void sub_80489C8(struct MultiBootSendProc * proc)
{
    int k;
    int state;
    int clientBit;

    for (k = 1; k <= 3; k++)
    {
        if (((mp->response_bit >> k) & 1) == 0)
            gSioSt->playerStatus[k] = 0;
        else if (((mp->client_bit >> k) & 1) == 0)
            gSioSt->playerStatus[k] = 1;
        else
            gSioSt->playerStatus[k] = 3;
    }

    if (proc->state == 0)
    {
        if (gKeyStatusPtr->newKeys & 2)
        {
            SioPlaySoundEffect(1);
            Proc_Goto(proc, 0xb);
            return;
        }
    }

    state = proc->state;
    if (state == 1)
    {
        MultiBootStartMaster(mp, gMultiBootImagep + 0xc0, gMultiBootImageSize - 0xc0, 4, state);
        proc->state = 2;
    }

    MultiBootMain(mp);

    if (proc->state == 0 && mp->probe_count == 0 && (clientBit = mp->client_bit) == 2)
    {
        MultiBootStartMaster(mp, gMultiBootImagep + 0xc0, gMultiBootImageSize - 0xc0, 4, 1);
        proc->state = clientBit;
    }

    if (MultiBootCheckComplete(mp))
        Proc_Break(proc);
}
