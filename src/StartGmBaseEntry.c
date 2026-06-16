#include "global.h"
#include "worldmap.h"

struct GmapBaseEntryProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ s8 unk_2c;
    /* 2D */ u8 unk_2d;
};

extern struct ProcCmd gProcScr_GmapBaseEntry[];

ProcPtr StartGmBaseEntry(int a, int b, ProcPtr parent)
{
    struct GmapBaseEntryProc * proc;

    if (parent != 0)
    {
        proc = Proc_StartBlocking(gProcScr_GmapBaseEntry, parent);
    }
    else
    {
        proc = Proc_Start(gProcScr_GmapBaseEntry, PROC_TREE_3);
    }

    proc->unk_29 = a;
    proc->unk_2a = b;

    // return proc; // BUG
}
