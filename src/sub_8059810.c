#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrbattle.h"
void EkrPrepareBanimfx(struct Anim * anim, int index) {
    int idx = (s16)index;
    gBanimIdx[GetAnimPosition(anim)] = idx;
    UpdateBanimFrame();
    SwitchAISFrameDataFromBARoundType(anim, 6);
}
