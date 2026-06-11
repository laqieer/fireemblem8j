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

// clang-format off

extern struct PlayerInterfaceConfigEntry CONST_DATA sPlayerInterfaceConfigLut[4];













s8 CONST_DATA sMMBSlideInWidthLut[4] =
{
    5, 9, 11, 13
};

s8 CONST_DATA sMMBSlideOutWidthLut[3] =
{
    11, 7, 0
};

s8 CONST_DATA sTerrainSlideInWidthLut[3] =
{
    4, 5, 6
};

s8 CONST_DATA sTerrainSlideOutWidthLut[6] =
{
    5, 4, 0, 0, 0, 0
};

















/* prototypes for same-file helpers called by this run */
void GetHpBarLeftTile(u16 * buffer, s16 hp, int tileBase);
void GetHpBarMidTiles(u16 * buffer, s16 hp, int tileBase);
void GetHpBarRightTile(u16 * buffer, s16 hp, int tileBase);
void UnitMapUiUpdate(struct PlayerInterfaceProc * proc, struct Unit * unit);

//! FE8U = 0x0808BC94
void DrawHpBar(u16 * buffer, struct Unit * unit, int tileBase)
{
    s16 hpCurrent = 50 * GetUnitCurrentHp(unit);
    s16 hpPercent = Div(hpCurrent, GetUnitMaxHp(unit));

    GetHpBarLeftTile(buffer, hpPercent, tileBase);
    GetHpBarMidTiles(buffer + 1, hpPercent - 5, tileBase);
    GetHpBarRightTile(buffer + 6, hpPercent - 45, tileBase);

    return;
}

//! FE8U = 0x0808BCF8
void MMB_Loop_SlideIn(struct PlayerInterfaceProc * proc)
{
    int tmIndex;
    int width;

    int y = sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug < 0 ? 0 : 14;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
    {
        tmIndex = TILEMAP_INDEX(0, y);

        TileMap_FillRect(gBG0TilemapBuffer + tmIndex, 13, 6, 0);
        TileMap_FillRect(gBG1TilemapBuffer + tmIndex, 13, 6, 0);
    }
    else
    {
        tmIndex = TILEMAP_INDEX(0, y);

        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(17, 0) + tmIndex, 13, 6, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(17, 0) + tmIndex, 13, 6, 0);
    }

    tmIndex = TILEMAP_INDEX(0, y);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sMMBSlideInWidthLut[proc->showHideClock];

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
    {
        TileMap_CopyRect(gUiTmScratchA + (13 - width), gBG0TilemapBuffer + tmIndex, width, 6);
        TileMap_CopyRect(gUiTmScratchB + (13 - width), gBG1TilemapBuffer + tmIndex, width, 6);
    }
    else
    {
        TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + TILEMAP_INDEX(30 - width, y), width, 6);
        TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + TILEMAP_INDEX(30 - width, y), width, 6);
    }

    proc->showHideClock++;

    if (proc->showHideClock == 4)
    {
        proc->hideContents = false;
        proc->showHideClock = 0;

        Proc_Break(proc);

        UnitMapUiUpdate(proc, GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]));
    }

    return;
}

//! FE8U = 0x0808BE70
void MMB_Loop_SlideOut(struct PlayerInterfaceProc * proc)
{
    int tmIndex;
    int width;

    int y = sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug < 0 ? 0 : 14;

    proc->hideContents = true;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
    {
        tmIndex = TILEMAP_INDEX(0, y);

        TileMap_FillRect(gBG0TilemapBuffer + tmIndex, 13, 6, 0);
        TileMap_FillRect(gBG1TilemapBuffer + tmIndex, 13, 6, 0);
    }
    else
    {
        tmIndex = TILEMAP_INDEX(0, y);

        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(17, 0) + tmIndex, 13, 6, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(17, 0) + tmIndex, 13, 6, 0);
    }

    tmIndex = TILEMAP_INDEX(0, y);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sMMBSlideOutWidthLut[proc->showHideClock];

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
    {
        TileMap_CopyRect(gUiTmScratchA + (13 - width), gBG0TilemapBuffer + tmIndex, width, 6);
        TileMap_CopyRect(gUiTmScratchB + (13 - width), gBG1TilemapBuffer + tmIndex, width, 6);
    }
    else
    {
        TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + TILEMAP_INDEX(30 - width, y), width, 6);
        TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + TILEMAP_INDEX(30 - width, y), width, 6);
    }

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->isRetracting = false;
        proc->showHideClock = 0;
        proc->windowQuadrant = -1;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808BFD4
void TerrainDisplay_Loop_SlideIn(struct PlayerInterfaceProc * proc)
{
    int width;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
    {
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(0, 13), 7, 7, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(0, 13), 7, 7, 0);
    }
    else
    {
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(23, 13), 7, 7, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(23, 13), 7, 7, 0);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sTerrainSlideInWidthLut[proc->showHideClock] + 1;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
    {
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(7 - width, 10), gBG0TilemapBuffer + TILEMAP_INDEX(0, 13), width, 7);
        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(7 - width, 10), gBG1TilemapBuffer + TILEMAP_INDEX(0, 13), width, 7);
    }
    else
    {
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(0, 10), gBG0TilemapBuffer + TILEMAP_INDEX(30 - width, 13), width, 7);
        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(0, 10), gBG1TilemapBuffer + TILEMAP_INDEX(30 - width, 13), width, 7);
    }

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->showHideClock = 0;
        proc->hideContents = false;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808C100
void TerrainDisplay_Loop_SlideOut(struct PlayerInterfaceProc * proc)
{
    int width;

    proc->hideContents = true;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
    {
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(0, 13), 7, 7, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(0, 13), 7, 7, 0);
    }
    else
    {
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(23, 13), 7, 7, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(23, 13), 7, 7, 0);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sTerrainSlideOutWidthLut[proc->showHideClock];

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
    {
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(6 - width, 10), gBG0TilemapBuffer + TILEMAP_INDEX(0, 13), width, 7);
        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(6 - width, 10), gBG1TilemapBuffer + TILEMAP_INDEX(0, 13), width, 7);
    }
    else
    {
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(0, 10), gBG0TilemapBuffer + TILEMAP_INDEX(30 - width, 13), width, 7);
        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(0, 10), gBG1TilemapBuffer + TILEMAP_INDEX(30 - width, 13), width, 7);
    }

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->showHideClock = 0;
        proc->hideContents = false;
        proc->isRetracting = false;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808C234
void PutUnitMapUiWindow(struct PlayerInterfaceProc * proc)
{
    int x;
    int y;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
    {
        x = 0;
    }
    else
    {
        x = 18;
    }

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug < 0)
    {
        y = 0;
    }
    else
    {
        y = 14;
    }

    TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + TILEMAP_INDEX(x, y), 13, 6);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x0808C288
void PutTerrainDisplayWindow(struct PlayerInterfaceProc * proc)
{
    int x;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
    {
        x = 0;
    }
    else
    {
        x = 23;
    }

    TileMap_CopyRect(gUiTmScratchA + TILEMAP_INDEX(0, 10), gBG0TilemapBuffer + TILEMAP_INDEX(x, 13), 7, 7);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

//! FE8U = 0x0808C2CC
void ApplyUnitMapUiFramePal(int faction, int palId)
{
    u16 * pal = NULL;

    switch (faction)
    {
    case FACTION_BLUE:
        pal = gPal_PlayerInterface_Blue;
        break;

    case FACTION_RED:
        pal = gPal_PlayerInterface_Red;
        break;

    case FACTION_GREEN:
        pal = gPal_PlayerInterface_Green;
        break;

    default:
        Nop_Bmmap_0();
        break;
    }

    ApplyPalette(pal, palId);

    return;
}
