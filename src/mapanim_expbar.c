

#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "hardware.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "m4a.h"

#include "mapanim.h"
#include "constants/songs.h"

void DrawMAExpBar(int arg0, int arg1, int arg2)
{
    MapAnim_DrawNumber(
        TILEMAP_LOCATED(gBG0TilemapBuffer,
            arg0 + 2,
            arg1 + 1),
        arg2, 0x5225, 2, 0x522F, FALSE);

    MapAnim_DrawBar(
        TILEMAP_LOCATED(gBG0TilemapBuffer,
            arg0 + 3,
            arg1 + 1),
        99, arg2, 0, gMapanimExpbar_0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void ProcMAExpBar_OnDraw(struct MAExpBarProc* proc)
{
    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);

    // TODO: ApplyTileImages macros?
    // TODO: BM_BGCHR_...?

    RegisterDataMove(
        Img_EkrExpBar,
        (void*)(VRAM) + GetBackgroundTileDataOffset(0) + 512 * 0x20,
        13 * 0x20);

    RegisterDataMove(
        Img_EkrExpBarChange,
        (void*)(VRAM) + GetBackgroundTileDataOffset(0) + 525 * 0x20,
        24 * 0x20);

    RegisterDataMove(
        Img_BarNumfx,
        (void*)(VRAM) + GetBackgroundTileDataOffset(0) + 549 * 0x20,
        11 * 0x20);

    ApplyPalette(Pal_ExpBar, BM_BGPAL_BANIM_UNK5);

    CallARM_FillTileRect(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 6, 8),
        gMapanimLevelup_0,
        TILEREF(512, BM_BGPAL_BANIM_UNK5));

    DrawMAExpBar(6, 8, proc->expFrom);
}

void ProcMAExpBar_PlaySound74(void)
{
    PlaySoundEffect(SONG_74);
}
