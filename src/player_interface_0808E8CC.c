#include "global.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmmap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "icon.h"
#include "uiutils.h"
#include "uichapterstatus.h"
#include "chapterdata.h"
#include "face.h"
#include "bm.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "bmlib.h"
#include "worldmap.h"
#include "player_interface.h"
#include "constants/event-flags.h"
#include "constants/msg.h"
#include "constants/terrains.h"

int GetWindowQuadrant(int x, int y);
void UnitMapUiUpdate(struct PlayerInterfaceProc * proc, struct Unit * unit);

//! FE8U = 0x0808C5D0
void DrawUnitMapUi(struct PlayerInterfaceProc * proc, struct Unit * unit)
{
    char * str;
    int pos;
    int faceId;

    CpuFastFill(0, gUiTmScratchA, 6 * CHR_SIZE * sizeof(u16));

    str = GetStringFromIndex(unit->pCharacterData->nameTextId);
    pos = GetStringTextCenteredPos(56, str);

    ClearText(proc->texts);
    Text_SetParams(proc->texts, pos, TEXT_COLOR_SYSTEM_BLACK);
    Text_DrawString(proc->texts, str);
    PutText(proc->texts, gUiTmScratchA + TILEMAP_INDEX(5, 1));

    faceId = GetUnitMiniPortraitId(unit);

    if (unit->state & US_BIT23)
    {
        faceId = faceId + 1;
    }

    PutFaceChibi(faceId, gUiTmScratchA + TILEMAP_INDEX(1, 1), 0xF0, 4, 0);

    proc->statusTm = gUiTmScratchA + TILEMAP_INDEX(5, 3);
    proc->unitClock = 0;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
    {
        proc->xHp = 5;
    }
    else
    {
        proc->xHp = 23;
    }

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug < 0)
    {
        proc->yHp = 3;
    }
    else
    {
        proc->yHp = 17;
    }

    UnitMapUiUpdate(proc, unit);
    DrawHpBar(gUiTmScratchA + TILEMAP_INDEX(5, 4), unit, TILEREF(0x140, 1));

    CallARM_FillTileRect(gUiTmScratchB, gTSA_MinimugBox, TILEREF(0x0, 3));
    ApplyUnitMapUiFramePal(UNIT_FACTION(unit), 3);

    return;
}

//! FE8U = 0x0808C710
int GetUnitBurstMapUiOrientationAt(int x, int y)
{
    int cursorQuadrant = GetCursorQuadrant();

    int result = 1;

    if ((y < 6) || ((y < 12) && (sPlayerInterfaceConfigLut[cursorQuadrant].yGoal < 0)))
    {
        result = 4;
    }

    if (x < 2)
    {
        result = result - 1;
    }

    if (x > 22)
    {
        result = result + 1;
    }

    return result;
}

//! FE8U = 0x0808C750
void DrawUnitBurstMapUi(struct PlayerInterfaceProc * proc, struct Unit * unit)
{
    int x;
    int y;
    int orientation;
    char * nameStr;
    int pos;

    x = (unit->xPos * 16 - gBmSt.camera.x) / 8;
    y = (unit->yPos * 16 - gBmSt.camera.y) / 8;

    orientation = GetUnitBurstMapUiOrientationAt(x, y);

    x = x + gUnitBurstMapUiXOffsetTable[orientation];
    y = y + gUnitBurstMapUiYOffsetTable[orientation];

    proc->xBurst = x;
    proc->yBurst = y;

    proc->wBurst = 8;
    proc->hBurst = 5;

    nameStr = GetStringFromIndex(unit->pCharacterData->nameTextId);
    pos = GetStringTextCenteredPos(56, nameStr);

    ClearText(proc->texts);

    Text_SetParams(proc->texts, pos, TEXT_COLOR_SYSTEM_BLACK);
    Text_DrawString(proc->texts, nameStr);

    PutText(proc->texts, gBG0TilemapBuffer + TILEMAP_INDEX(
        x + gUnitBurstMapUiTextXTable[orientation],
        y + gUnitBurstMapUiTextYTable[orientation]));

    proc->statusTm = gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3);

    proc->unitClock = 0;

    proc->xHp = x + 1;
    proc->yHp = y + 3;

    UnitMapUiUpdate(proc, unit);

    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, y), gPlayerInterface_0[orientation], TILEREF(0x100, 3));
    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, y + 1), gUnkData_54, TILEREF(0x100, 3));
    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, y + 4), gPlayerInterface_1[orientation], TILEREF(0x100, 3));

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    ApplyUnitMapUiFramePal(UNIT_FACTION(unit), 3);

    return;
}

//! FE8U = 0x0808C8EC
void ClearUnitBurstMapUi(struct PlayerInterfaceProc * proc)
{
    if (proc->wBurst == 8 && proc->hBurst == 5)
    {
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(proc->xBurst, proc->yBurst), proc->wBurst, proc->hBurst, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(proc->xBurst, proc->yBurst), proc->wBurst, proc->hBurst, 0);

        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

        proc->wBurst = 0;
        proc->hBurst = 0;
    }

    return;
}

//! FE8U = 0x0808C964
void DrawTerrainDisplayWindow(struct PlayerInterfaceProc * proc)
{
    char * str;
    int num;

    int terrainId = gBmMapTerrain[gBmSt.playerCursor.y][gBmSt.playerCursor.x];

    TileMap_FillRect(gUiTmScratchA + TILEMAP_INDEX(0, 10), 14, 7, 0);
    TileMap_FillRect(gUiTmScratchB + TILEMAP_INDEX(0, 10), 14, 7, 0);

    str = GetTerrainName(terrainId);

    num = GetStringTextCenteredPos(40, str);

    ClearText(proc->texts);
    Text_SetParams(proc->texts, num, TEXT_COLOR_SYSTEM_WHITE);
    Text_DrawString(proc->texts, str);
    PutText(proc->texts, gUiTmScratchA + TILEMAP_INDEX(1, 12));

    CallARM_FillTileRect(gUiTmScratchA + TILEMAP_INDEX(1, 14), Tsa_TerrainMapUi_Labels, TILEREF(0x100, 2));

    if (TerrainTable_MovCost_BerserkerNormal[terrainId] > 0)
    {
        StoreNumberStringToSmallBuffer(TerrainTable_Def_Common[terrainId]);
        PutDigits(gUiTmScratchA + TILEMAP_INDEX(5, 14), gNumberStr + 7, TILEREF(0x128, 2), 2);

        StoreNumberStringToSmallBuffer(TerrainTable_Avo_Common[terrainId]);
        PutDigits(gUiTmScratchA + TILEMAP_INDEX(5, 15), gNumberStr + 7, TILEREF(0x128, 2), 2);
    }

    switch (terrainId)
    {
    case TERRAIN_SNAG:
    case TERRAIN_WALL_DAMAGED:
        CallARM_FillTileRect(gUiTmScratchA + TILEMAP_INDEX(1, 14), Tsa_TerrainMapUi_ObstacleLabels, TILEREF(0x100, 2));

        num = GetObstacleHpAt(gBmSt.playerCursor.x, gBmSt.playerCursor.y);

        if (num == 100)
        {
            CallARM_FillTileRect(gUiTmScratchA + TILEMAP_INDEX(4, 15), Tsa_TerrainMapUi_ObstacleFullHp, TILEREF(0x100, 0));
        }
        else
        {
            StoreNumberStringToSmallBuffer(num);
            PutDigits(gUiTmScratchA + TILEMAP_INDEX(5, 15), gNumberStr + 7, TILEREF(0x128, 2), 2);
        }

        break;

    case TERRAIN_BALLISTA_REGULAR:
    case TERRAIN_BALLISTA_LONG:
    case TERRAIN_BALLISTA_KILLER:
        CallARM_FillTileRect(gUiTmScratchA + TILEMAP_INDEX(1, 14), gTSA_TerrainBox_Ballistae, TILEREF(0x100, 0));

        StoreNumberStringToSmallBuffer(GetObstacleHpAt(gBmSt.playerCursor.x, gBmSt.playerCursor.y));
        PutDigits(gUiTmScratchA + TILEMAP_INDEX(5, 14), gNumberStr + 7, TILEREF(0x128, 2), 2);

        break;
    }

    CallARM_FillTileRect(gUiTmScratchB + TILEMAP_INDEX(0, 11), gTSA_TerrainBox, TILEREF(0x0, 1));
}

//! FE8U = 0x0808CB34
void TerrainDisplay_Init(struct PlayerInterfaceProc * proc)
{
    proc->windowQuadrant = -1;
    proc->isRetracting = false;
    proc->showHideClock = 0;
    proc->cursorQuadrant = 1;

    InitTextDb(proc->texts, 5);

    return;
}

//! FE8U = 0x0808CB5C
void TerrainDisplay_Loop_OnSideChange(struct PlayerInterfaceProc * proc)
{
    int quadrant;
    struct PlayerInterfaceProc * ui1Proc;
    struct PlayerInterfaceProc * piProc;

    proc->hideContents = true;

    proc->cursorQuadrant = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain,
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].yTerrain);

    ui1Proc = Proc_Find(gProcScr_UnitDisplay_MinimugBox);

    if (ui1Proc != NULL)
    {
        if ((ui1Proc->windowQuadrant > -1) && (ui1Proc->windowQuadrant == quadrant))
        {
            return;
        }
    }

    piProc = Proc_Find(gProcScr_GoalDisplay);

#if BUGFIX
    if (piProc != NULL)
#else
    if (ui1Proc != NULL)
#endif // BUGFIX
    {
        if ((piProc->windowQuadrant > -1) && (piProc->windowQuadrant == quadrant))
        {
            return;
        }
    }

    proc->windowQuadrant = quadrant;

    DrawTerrainDisplayWindow(proc);

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0808CC00
void TerrainDisplay_Loop_Display(struct PlayerInterfaceProc * proc)
{
    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    if ((proc->xCursor == proc->xCursorPrev) && (proc->yCursor == proc->yCursorPrev))
    {
        return;
    }

    if (Proc_Find(ProcScr_CamMove) == NULL)
    {
        int cursorQuadrant = GetCursorQuadrant();

        if ((cursorQuadrant == proc->cursorQuadrant) ||
            ((sPlayerInterfaceConfigLut[cursorQuadrant].xTerrain ==
              sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain) &&
             (sPlayerInterfaceConfigLut[cursorQuadrant].yTerrain ==
              sPlayerInterfaceConfigLut[proc->cursorQuadrant].yTerrain)))
        {
            DrawTerrainDisplayWindow(proc);
            PutTerrainDisplayWindow(proc);
            return;
        }
    }

    proc->isRetracting = true;

    Proc_Break(proc);

    return;
}
