#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern u16 gUnk_16[];
extern u16 gUnk_17[];
extern u8 const gWorldmapRadar_0[];

//! FE8U = 0x080C3BE4
void PutWmMinimapGfx(struct GMapRadarProc * proc, int b)
{
    switch (gWorldmapRadar_0[proc->unk_2a + gGMData.state.bits.state_4_5 * 5])
    {
        case 0:
            TileMap_FillRect(gBG0TilemapBuffer, 8, 8, 0);
            TileMap_CopyRect(gUnk_16 + (0x1c - b), gBG0TilemapBuffer, b, 8);
            proc->unk_2f = b - 8;
            proc->unk_30 = 0;

            break;

        case 1:
            TileMap_FillRect(gBG0TilemapBuffer + 0x16, 8, 8, 0);
            TileMap_CopyRect(gUnk_17, gBG0TilemapBuffer + (0x1e - b), b, 8);
            proc->unk_2f = 30 - b;
            proc->unk_30 = 0;

            break;

        case 2:
            TileMap_FillRect(gBG0TilemapBuffer + 0x180, 8, 8, 0);
            TileMap_CopyRect(gUnk_16 + (0x1c - b), gBG0TilemapBuffer + 0x180, b, 8);
            proc->unk_2f = b - 8;
            proc->unk_30 = 12;

            break;

        case 3:
            TileMap_FillRect(gBG0TilemapBuffer + 0x196, 8, 8, 0);
            TileMap_CopyRect(gUnk_17, gBG0TilemapBuffer + (0x19e - b), b, 12);
            proc->unk_2f = 30 - b;
            proc->unk_30 = 12;

            break;
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}
