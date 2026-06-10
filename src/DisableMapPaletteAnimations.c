#include "global.h"
#include "proc.h"

struct BMVSyncProc {
    PROC_HEADER;

    /* 2C */ const void * tileGfxAnimStart;
    /* 30 */ const void * tileGfxAnimCurrent;

    /* 34 */ short tileGfxAnimClock;
    /* 36 */ short tilePalAnimClock;

    /* 38 */ const void * tilePalAnimStart;
    /* 3C */ const void * tilePalAnimCurrent;
};

extern struct ProcCmd sProc_BMVSync[];

void DisableMapPaletteAnimations(void) {
    struct BMVSyncProc* proc = Proc_Find(sProc_BMVSync);

    if (proc)
        proc->tilePalAnimStart = NULL;
}
