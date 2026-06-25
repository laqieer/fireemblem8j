#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "event.h"
#include "m4a.h"

struct BgmTriggerProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x38);
    /* 38 */ s16 * pSong;
    /* 3C */ u16 flags;
};

int sub_800E11C(struct BgmTriggerProc * proc)
{
    s16 song;

    if ((proc->flags >> 2) & 1)
        return 0;

    song = proc->pSong[1];
    if (song < 0)
    {
        s16 * pSlots = (s16 *)gEventSlots;
        song = pSlots[4];
    }

    if (!gPlaySt.config.disableSoundEffects)
        m4aSongNumStart(song);

    return 0;
}
