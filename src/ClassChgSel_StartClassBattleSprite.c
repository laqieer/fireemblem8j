#include "global.h"
#include "classchg.h"
#include "proc.h"
#include "hardware.h"
#include "scene.h"
#include "classdisplayfont.h"
#include "constants/video-global.h"
#include "constants/classes.h"
#include "bmlib.h"
#include "ctc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmsave.h"
#include "bm.h"
#include "bmmind.h"
#include "bmio.h"
#include "bmmap.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmitem.h"
#include "prepscreen.h"

void ClassChgSel_StartClassBattleSprite(int a, int b, int c, int d, int e) {
    register int c1 asm("r6") = (s16)c;
    int d1 = (s16)d;
    if (gKeyStatusPtr->heldKeys & 0xc)
        gUnk_83[0] = 0;

    if (gKeyStatusPtr->newKeys & 0x200)
        gUnk_83[0] += 1;

    NewEfxAnimeDrvProc();
    gUnk_81.xPos = c1;
    gUnk_81.yPos = d1;
    gUnk_81.state2 = 1;
    gUnk_81.animId = a;
    gUnk_81.charPalId = b;
    gUnk_81.roundType = e;
    gUnk_81.genericPalId = 0;
    gUnk_81.oam2Tile = 0x200;
    gUnk_81.oam2Pal = 0xa;
    gUnk_81.pImgSheetBuf = gBanimLeftImgSheetBuf;
    gUnk_81.unk_24 = gBanimOaml;
    gUnk_81.unk_20 = gBanimPaletteLeft;
    gUnk_81.unk_28 = gBanimScrLeft;
    gUnk_81.unk_30 = &gUnk_82;
    gUnk_82.u00 = 0x4;
    gUnk_82.u02 = 0;
    gUnk_82.u04 = 0;
    gUnk_82.u06 = 0;
    gUnk_82.u08 = 0;
    gUnk_82.u0e = 0x300;
    gUnk_82.u10 = 0x8;
    gUnk_82.u0a = 0x200;
    gUnk_82.u0c = 0x4;
    gUnk_82.u12 = 0x1;
    gUnk_82.buf = gBG1TilemapBuffer;
    gUnk_82.u18 = gSpellAnimBgfx;
    gUnk_82.u1c = (void *)gEkrTsaBuffer;
    gUnk_82.u20 = gBuf_Banim;
    gUnk_82.u24 = ClassChgSel_SetBlendWindowConfig;

    ResetClassReelSpell();
    NewEkrUnitMainMini(&gUnk_81);
}
