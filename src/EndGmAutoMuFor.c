#include "global.h"
#include "worldmap.h"

struct AutoMuTarget
{
    /* 00 */ union
    {
        u8 node;
        struct Vec2 pos;
    } src;
    /* 04 */ union
    {
        u8 node;
        struct Vec2 pos;
    } dst;
};
struct GMapAutoMuProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 kind;
    /* 2A */ u8 flags;
    // 2B
    /* 2C */ u16 unitId;
    /* 2E */ u16 unk_2e;
    /* 30 */ struct AutoMuTarget target;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ s16 speed;
    /* 3C */ s16 delay;
};
extern struct ProcCmd  ProcScr_GmapAutoMu[];

void EndGmAutoMuFor(int index)
{
    struct GMapAutoMuProc * proc;
    struct ProcFindIterator procIter;

    if (index < 0)
    {
        Proc_EndEach(ProcScr_GmapAutoMu);
        return;
    }

    Proc_FindBegin(&procIter, ProcScr_GmapAutoMu);
    do
    {
        proc = Proc_FindNext(&procIter);

        if (proc->unitId == index)
        {
            Proc_End(proc);
            return;
        }
    } while (proc != NULL);

    return;
}
