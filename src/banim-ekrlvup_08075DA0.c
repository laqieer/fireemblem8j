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

void EkrLvup_DrawUpdatedStatus(struct ProcEkrLevelup *proc, int index)
{
    ClearText(&gBanimText[EKRLVUP_STAT_MAX + index]);
    Text_SetCursor(&gBanimText[EKRLVUP_STAT_MAX + index], 8);
    Text_SetColor(&gBanimText[EKRLVUP_STAT_MAX + index], TEXT_COLOR_SYSTEM_BLUE);
    Text_DrawNumber(&gBanimText[EKRLVUP_STAT_MAX + index], gEkrLvupBaseStatus[index]);
    PutText(&gBanimText[EKRLVUP_STAT_MAX + index], gBG2TilemapBuffer + 3 + sEfxLvupPartsPos[index]);
}
