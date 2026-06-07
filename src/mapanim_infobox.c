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
void MapInfoBox_DrawHp(struct MAInfoFrameProc* proc, int a);
u16* GetBattleInfoPalByFaction(struct Unit* unit);

void DisplayBattleInfoBox(struct MAInfoFrameProc* proc, int index, int arg2)
{
    gManimSt.actor[index].hp_info_x = proc->x + arg2;
    gManimSt.actor[index].hp_info_y = proc->y;

    ApplyPalette(
        GetBattleInfoPalByFaction(gManimSt.actor[index].unit),
        BM_BGPAL_BANIM_IFBACK + index);

    Decompress(
        TsaSet_MapBattleBoxGfx[gManimSt.actorCount][index], gGenericBuffer);

    CallARM_FillTileRect(
        TILEMAP_LOCATED(gBG1TilemapBuffer,
            gManimSt.actor[index].hp_info_x,
            gManimSt.actor[index].hp_info_y),
        (u16*) gGenericBuffer,
        (u16)(BM_BGCHR_BANIM_IFBACK | TILEREF(0, BM_BGPAL_BANIM_IFBACK + index)));

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    PutStringCentered(
        TILEMAP_LOCATED(gBG0TilemapBuffer,
            gManimSt.actor[index].hp_info_x + 2,
            gManimSt.actor[index].hp_info_y + 1),
        0, 9,
        GetStringFromIndex(UNIT_NAME_ID(gManimSt.actor[index].unit)));

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    gManimSt.actor[index].hp_displayed_q4 = gManimSt.actor[index].hp_cur*16;

    MapInfoBox_DrawHp(proc, index);
}

void MapInfoBox_PrepareForShake(struct MAInfoFrameProc* proc)
{
    proc->unk2A = 0;

    MapInfoBoxShake(proc);

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);
}

void MapInfoBoxShake(struct MAInfoFrameProc* proc)
{
    // TODO: SetWin0PtA macro?
    gLCDControlBuffer.win0_left   = 0;
    gLCDControlBuffer.win0_top    = (proc->y+2)*8 - proc->unk2A;

    // TODO: SetWin0PtB macro?
    gLCDControlBuffer.win0_right  = 240; // TODO: SCREEN_WIDTH?
    gLCDControlBuffer.win0_bottom = (proc->y+2)*8 + proc->unk2A;

    proc->unk2A += 2;

    if (proc->unk2A > 0x10) {
        SetWinEnable(0, 0, 0);
        Proc_Break(proc);
    }
}
