#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"

struct BmxfadeProc {
    PROC_HEADER;

    /* 29 */ u8 _pad29[0x4C - 0x29];
    /* 4C */ s16 counter;
    /* 4E */ s16 game_lock;
};

void bmxfade_init(struct BmxfadeProc *proc)
{
    proc->counter = 0x10;

    InitBmBgLayers();

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);
}
