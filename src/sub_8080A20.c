#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"
#include "constants/video-global.h"
extern const u8 gMapAnimParamList_520D[];
void MapAnimRepair_Loop1(struct MAEffectProc * proc) {
    PutTmAnimFrameFromTsa(
        gBG2TilemapBuffer,
        proc->xDisplay / 8 - 2, proc->yDisplay / 8 - 8,
        TILEREF(BGCHR_MANIM_140, BGPAL_MANIM_4),
        4, 10, Tsa_Mapnightmare,
        gMapAnimParamList_520D[proc->unk48++]);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    if (gMapAnimParamList_520D[proc->unk48] == UINT8_MAX)
        Proc_Break(proc);
}
