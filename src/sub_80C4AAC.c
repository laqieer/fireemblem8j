#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "worldmap.h"

struct BlendStruct
{
    /* 00 */ struct BlendCnt blendCnt;
    /* 08 */ u8 blendCoeffA;
    /* 09 */ u8 blendCoeffB;
    /* 0A */ u8 blendY;
};

struct GmapBaseEntryProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ s8 unk_2c;
    /* 2D */ u8 unk_2d;
    /* 30 */ struct BlendStruct unk_30;
};

extern struct ProcCmd gProcScr_GmapMuEntry1[];

ProcPtr StartGmapMuEntry1(int a, int b, ProcPtr parent)
{
    struct GmapBaseEntryProc * proc;

    if (parent)
    {
        proc = Proc_StartBlocking(gProcScr_GmapMuEntry1, parent);
    }
    else
    {
        proc = Proc_Start(gProcScr_GmapMuEntry1, PROC_TREE_3);
    }

    proc->unk_29 = a;
    proc->unk_2a = b;
}
