#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "spline.h"
#include "worldmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_GmapMuEntry2[];

struct GmapMuEntryProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 flags_0 : 1;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ u8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ s16 unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
};

//! FE8U = 0x080C02A4
s8 GmMuEntryStartHide(int a, int b)
{
    struct GmapMuEntryProc * proc = Proc_Find(gProcScr_GmapMuEntry2);

    if (proc->flags_0)
    {
        return 1;
    }

    proc->unk_2c = 16;
    proc->unk_2d = 0;
    proc->unk_2e = 56;
    proc->unk_2f = 0;
    proc->unk_30 = b;
    proc->unk_34 = a << 12;
    proc->flags_0 = 1;

    Proc_Goto(proc, 2);

    return 0;
}
