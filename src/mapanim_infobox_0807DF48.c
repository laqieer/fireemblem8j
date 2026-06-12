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
void PrepareMapBattleBoxNumGfx(const u8* src);
void DisplayBattleInfoBox(struct MAInfoFrameProc* proc, int index, int arg2);

void ProcMapInfoBox_OnDraw(struct MAInfoFrameProc* proc)
{
    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);

    Decompress(
        Img_MapBattleInfoBox,
        (void*)(VRAM) + GetBackgroundTileDataOffset(1) + BM_BGCHR_BANIM_IFBACK * 0x20); //< TODO: put in macro?

    PrepareMapBattleBoxNumGfx(Img_MapBattleInfoHpBar);

    switch (gManimSt.actorCount) {
    case 1:
        DisplayBattleInfoBox(proc, 0, -5);
        break;

    case 2:
        DisplayBattleInfoBox(proc, 0, -1);
        DisplayBattleInfoBox(proc, 1, -11);
        break;
    } // switch (gManimSt.actorCount_maybe)

    InitScanline();

    StartManimFrameGradientScanlineEffect(
        gManimSt.actor[0].hp_info_y*8,
        gManimSt.actor[0].hp_info_y*8 + 0x20,
        gPaletteBuffer[BGPAL_OFFSET(1) + 1],
        gPaletteBuffer[BGPAL_OFFSET(2) + 1]);
}
