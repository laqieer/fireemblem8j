#include "global.h"
#include "proc.h"
#include "ctc.h"

struct SpriteProc
{
    PROC_HEADER;

    /* 2C */ u32 x;
    /* 30 */ u32 y;
    /* 34 */ u8 pad34[0x50 - 0x34];
    /* 50 */ s16 layer;
    /* 52 */ u16 tileref;
    /* 54 */ const u16 * object;
};

void SpriteRefresher_OnIdle(struct SpriteProc* proc)
{
    PutSprite(proc->layer, proc->x, proc->y, proc->object, proc->tileref);
}
