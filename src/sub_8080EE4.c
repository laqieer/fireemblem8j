#include "global.h"
#include "bmlib.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "fontgrp.h"
#include "mapanim.h"
void PutManimLevelUpStat(int actor_id, int x, int y, int stat_num, int after_gain) {
    int ag = (s8)after_gain;
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG0TilemapBuffer, x + gManimLevelUpLabelInfoList[stat_num].x + 4, y + gManimLevelUpLabelInfoList[stat_num].y),
        TEXT_COLOR_SYSTEM_BLUE,
        GetManimLevelUpBaseStat(actor_id, stat_num) + (ag ? GetManimLevelUpStatGain(actor_id, stat_num) : 0));
}
