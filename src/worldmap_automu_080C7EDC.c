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

//! FE8U = 0x080C3124
void GmapAutoMu_OnEnd(struct GMapAutoMuProc * proc)
{
    if (GmMu_IsMoving(GM_MU, proc->unitId) != 0)
    {
        GmMu_FinishMovement(GM_MU, proc->unitId);
    }

    EndGmapUnitFade();

    switch (proc->kind)
    {
        case 0:
        default:
            gGMData.units[proc->unitId].location = proc->target.dst.node;
            break;

        case 1:
            GmMu_SetPosition(GM_MU, proc->unitId, proc->target.dst.pos.x, proc->target.dst.pos.y);
            break;
    }

    if ((proc->flags & 2) != 0)
    {
        HideGmUnit(proc->unitId);
    }

    return;
}
