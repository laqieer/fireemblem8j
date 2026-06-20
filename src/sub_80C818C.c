#include "global.h"

#include "proc.h"
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

extern struct ProcCmd ProcScr_GmapAutoMu[];

ProcPtr StartGmapAutoMu_Type1(struct Sub80C33D4 * input, int flag, ProcPtr parent)
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

    proc->kind = 1;
    proc->flags = flag;
    proc->unitId = input->wm_uid;
    proc->unk_39 = input->unk_01;
    proc->unk_38 = input->unk_02;

    proc->target.src.pos.x = input->x1;
    proc->target.src.pos.y = input->y1;
    proc->target.dst.pos.x = input->x2;
    proc->target.dst.pos.y = input->y2;

    proc->delay = input->delay;
    proc->speed = input->speed;

    return proc;
}
