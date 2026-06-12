#include "global.h"

#include "proc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "icon.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "ctc.h"
#include "bmlib.h"
#include "popup.h"
#include "functions.h"
#include "variables.h"
#include "constants/characters.h"
#include "constants/items.h"








extern struct ProcCmd CONST_DATA ProcScr_PopupUpdateIcon[];









extern struct PopupInstruction CONST_DATA PopupScr_GoldWasStole[];







extern struct PopupInstruction CONST_DATA PopupScr_WRankUp[];



void PopupProc_GfxClear(struct PopupProc * proc)
{
    TileMap_FillRect(
        TILEMAP_LOCATED(gBG0TilemapBuffer, proc->xTileReal, proc->yTileReal),
        proc->xTileSize, proc->yTileSize, 0);

    TileMap_FillRect(
        TILEMAP_LOCATED(gBG1TilemapBuffer, proc->xTileReal, proc->yTileReal),
        proc->xTileSize, proc->yTileSize, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}
