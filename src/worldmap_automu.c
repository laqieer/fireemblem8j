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

//! FE8U = 0x080C3280
void GmapAutoMu_3(struct GMapAutoMuProc * proc)
{
    struct UnknownSub80BDEB4 input;

    input.unk_00 = proc->unitId;
    input.unk_01 = proc->unk_38;
    input.unk_06 = proc->target.src.node;
    input.unk_08 = proc->target.dst.node;
    input.unk_0c = proc->speed;
    input.unk_0a = 0;
    input.unk_02 = (proc->flags >> 2) & 1;
    input.unk_03 = 0xff;
    input.unk_04 = 4;

    GmMu_StartMoveBetweenNodes(GM_MU, &input);

    return;
}

//! FE8U = 0x080C32E4
void GmapAutoMu_4(struct GMapAutoMuProc * proc)
{
    struct UnknownSub80BDFA4 input;

    input.unk_00 = proc->unitId;
    input.unk_01 = proc->unk_39;
    input.unk_02 = proc->unk_38;
    input.unk_06 = proc->target.src.pos.x;
    input.unk_08 = proc->target.src.pos.y;
    input.unk_0a = proc->target.dst.pos.x;
    input.unk_0c = proc->target.dst.pos.y;
    input.unk_10 = proc->speed;
    input.unk_0e = 0;
    input.unk_03 = (proc->flags >> 2) & 1;
    input.unk_04 = 0xff;
    input.unk_05 = 4;

    GmMu_StartMoveToPosition(GM_MU, &input);

    return;
}

//! FE8U = 0x080C3350
void GmapAutoMu_5(struct GMapAutoMuProc * proc)
{
    if (!GmMu_IsMoving(GM_MU, proc->unitId))
    {
        Proc_Break(proc);
    }

    return;
}
