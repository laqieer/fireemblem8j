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

void EkrLvup_DrawUnitName(struct ProcEkrLevelup *proc)
{
    ClearText(&gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_PNAME]);
    Text_DrawString(&gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_PNAME], GetStringFromIndex(gpEkrLvupUnit->pClassData->nameTextId));
    PutText(&gBanimText[EKRLVUP_STAT_MAX + EKRLVUP_STAT_PNAME], TILEMAP_LOCATED(gBG2TilemapBuffer, 2, 7));
}
