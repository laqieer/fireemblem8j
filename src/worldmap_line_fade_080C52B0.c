#include "global.h"

#include "hardware.h"
#include "spline.h"
#include "sysutil.h"

#include "worldmap.h"

struct GmapLineFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
};

extern u8 gWmHblankStatus;

/* prototypes for same-file helpers called by this run */
void GmapLineFade_0(struct GmapLineFadeProc * proc);

//! FE8U = 0x080C04CC
void GmapLineFade_Loop(struct GmapLineFadeProc * proc)
{
    proc->unk_2a++;

    if (proc->unk_2a < proc->unk_2c)
    {
        GmapLineFade_0(proc);
    }
    else
    {
        Proc_Break(proc);
    }

    return;
}
