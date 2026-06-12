#include "global.h"

#include "hardware.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmsave.h"

#include "constants/msg.h"

#include "sio.h"

/* prototypes for same-file helpers called by this run */
void DrawLinkArenaRankIcon(u16 * tm, u32 base);
void DrawLinkArenaModeIcon(u16 * tm, u32 base);
void DrawLinkArenaRankingRow(struct Text * th, char * nameStr, u8 rank, u16 points, u8 playerCount);

//! FE8U = 0x08046F68
void DrawLinkArenaRankings(void)
{
    int i;

    for (i = 0; i < 10; i++)
    {
        ClearText(&Texts_1[i]);
        DrawLinkArenaRankingRow(
            &Texts_1[i], gSioResultRankings[i].name, gSioResultRankings[i].ranking + 1,
            gSioResultRankings[i].points, gSioResultRankings[i].player_count + 1);
        DrawLinkArenaRankIcon(TILEMAP_LOCATED(gBG1TilemapBuffer, 3, i * 2), i);
        PutText(&Texts_1[i], TILEMAP_LOCATED(gBG1TilemapBuffer, 6, i * 2));
        DrawLinkArenaModeIcon(TILEMAP_LOCATED(gBG1TilemapBuffer, 20, i * 2), gSioResultRankings[i].mode);
    }

    return;
}
