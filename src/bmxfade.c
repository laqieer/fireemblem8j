#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "bm.h"

void SetAllUnitNotBackSprite();

struct BmxfadeProc {
    PROC_HEADER;

    /* 29 */ u8 _pad29[0x4C - 0x29];
    /* 4C */ s16 counter;
    /* 4E */ s16 game_lock;
};

void bmxfade_init(struct BmxfadeProc *proc);
void bmxfade_loop(struct BmxfadeProc *proc);
void Destruct6CBMXFADE(struct BmxfadeProc *proc);



void bmxfade_loop(struct BmxfadeProc *proc)
{
    SetBlendConfig(1, proc->counter, 0x10 - proc->counter, 0);

    if (--proc->counter >= 0)
        return;

    Proc_Break(proc);
    SetDefaultColorEffects();
    SetBackgroundTileDataOffset(2, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(4);
}

void Destruct6CBMXFADE(struct BmxfadeProc *proc)
{
    SetAllUnitNotBackSprite();

    if (0 != proc->game_lock)
        UnlockGame();
}
