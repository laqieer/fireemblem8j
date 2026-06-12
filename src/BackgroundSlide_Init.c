#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

struct MuralBackgroundProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 offset;
};

//! FE8U = 0x08086B74
void BackgroundSlide_Init(struct MuralBackgroundProc* proc) {
    proc->offset = 0;
    return;
}
