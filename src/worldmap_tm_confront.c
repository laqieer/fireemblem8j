#include "global.h"

#include "soundwrapper.h"
#include "m4a.h"
#include "spline.h"
#include "bmlib.h"
#include "ap.h"

#include "worldmap.h"
#include "constants/songs.h"

struct GmapTmConfrontProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 unk_2a;
    /* 2C */ u16 unk_2c;
    /* 2E */ u8 unk_2e[2];
    /* 30 */ struct Vec2 unk_30[2];
    /* 38 */ struct Vec2 unk_38[2];
    /* 42 */ struct Vec2 unk_40[2];
    /* 48 */ void * unk_48;
};

//! FE8U = 0x080C054C
void GmTmConfront_LoadPositions(struct GmapTmConfrontProc * proc, const struct Vec2 * posArray)
{
    int i;

    for (i = 0; i < 2; i++)
    {
        GmMu_GetPosition(GM_MU, proc->unk_2e[i], &proc->unk_30[i].x, &proc->unk_30[i].y);
        proc->unk_40[i].x = posArray[i].x;
        proc->unk_40[i].y = posArray[i].y;
        proc->unk_38[i].x = proc->unk_30[i].x + posArray[i].x;
        proc->unk_38[i].y = proc->unk_30[i].y + posArray[i].y;
    }

    proc->unk_2a = 0;

    return;
}
