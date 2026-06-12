#include "global.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "spline.h"
#include "bmlib.h"
#include "ap.h"
#include "worldmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapTmConfront[];

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

// clang-format on

//! FE8U = 0x080C07D4
ProcPtr StartWorldmapSkirmishAnim(int a, int b, ProcPtr parent)
{
    struct GmapTmConfrontProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_GmapTmConfront, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_GmapTmConfront, PROC_TREE_3);
    }

    proc->unk_2e[1] = a;
    proc->unk_2e[0] = b;

#if BUGFIX
    return proc;
#endif
}
