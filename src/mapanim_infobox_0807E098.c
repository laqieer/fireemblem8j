#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "mapanim.h"
#include "bmlib.h"
#include "constants/songs.h"

/* prototypes for same-file helpers called by this run */
void MapAnim_DrawNumber(u16* tilemap, int num, int tileref, int len, u16 blankref, int arg5);
void MapAnim_DrawBar(u16* tilemap, int arg1, int arg2, int arg3, u16* buf);

void MapInfoBox_DrawHp(struct MAInfoFrameProc* proc, int a)
{
    int dummy = gManimSt.actor[a].hp_displayed_q4/16;
    int r6 = (dummy >= 100);

    MapAnim_DrawNumber(
        gBG0TilemapBuffer + TILEMAP_INDEX(
            gManimSt.actor[a].hp_info_x + 3,
            gManimSt.actor[a].hp_info_y + 3),
        gManimSt.actor[a].hp_displayed_q4/16,
        TILEREF(32, BM_BGPAL_BANIM_UNK5), 3, 0, r6);

    MapAnim_DrawBar(
        gBG0TilemapBuffer + TILEMAP_INDEX(
            gManimSt.actor[a].hp_info_x + 4,
            gManimSt.actor[a].hp_info_y + 3),
        gManimSt.actor[a].hp_max,
        gManimSt.actor[a].hp_displayed_q4/16,
        0, gMapanimInfobox_0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
