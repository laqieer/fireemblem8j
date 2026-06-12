#include "global.h"
#include "face.h"
#include "anime.h"
#include "proc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "ekrlevelup.h"
#include "constants/songs.h"

void EkrLvup_DrawPreLevelValue(struct ProcEkrLevelup *proc)
{
    ClearText(&gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_LVPRE_VAL]);
    Text_SetCursor(&gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_LVPRE_VAL], 8);
    Text_SetColor(&gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_LVPRE_VAL], TEXT_COLOR_SYSTEM_BLUE);
    Text_DrawNumber(&gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_LVPRE_VAL], gEkrLvupPreLevel);
    PutText(&gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_LVPRE_VAL], TILEMAP_LOCATED(gBG2TilemapBuffer, 13, 7));
}
