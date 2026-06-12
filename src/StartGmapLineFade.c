#include "global.h"
#include "hardware.h"
#include "spline.h"
#include "sysutil.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapLineFade[];

struct GmapLineFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
};

// clang-format on

//! FE8U = 0x080C04F4
ProcPtr StartGmapLineFade(int unk, ProcPtr parent)
{
    struct GmapLineFadeProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_GmapLineFade, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_GmapLineFade, PROC_TREE_3);
    }

    proc->unk_29 = unk;

    return proc;
}
