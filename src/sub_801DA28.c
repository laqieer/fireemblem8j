#include "global.h"
#include "proc.h"
#include "bm.h"

struct BmxfadeProc {
    PROC_HEADER;

    /* 29 */ u8 _pad29[0x4C - 0x29];
    /* 4C */ s16 counter;
    /* 4E */ s16 game_lock;
};

extern struct ProcCmd sProcScr_BMXFADE[];

void NewBMXFADE(s8 lock_game)
{
    int lock = lock_game;
    struct BmxfadeProc *proc = Proc_Start(sProcScr_BMXFADE, PROC_TREE_3);
    proc->game_lock = lock;

    if (0 != lock)
        LockGame();
}
