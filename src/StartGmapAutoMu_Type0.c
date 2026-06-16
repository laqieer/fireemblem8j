#include "global.h"
#include "worldmap.h"

extern struct ProcCmd ProcScr_GmapAutoMu[];

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

ProcPtr StartGmapAutoMu_Type0(struct Sub80C3378 * input, int flag, ProcPtr parent)
{
    struct GMapAutoMuProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_GmapAutoMu, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_GmapAutoMu, PROC_TREE_3);
    }

    proc->kind = 0;
    proc->flags = flag;

    proc->unitId = input->wm_uid;
    proc->unk_38 = input->unk_01;

    proc->target.src.node = input->srcNode;
    proc->target.dst.node = input->dstNode;

    proc->delay = input->delay;
    proc->speed = input->speed;

    return proc;
}
