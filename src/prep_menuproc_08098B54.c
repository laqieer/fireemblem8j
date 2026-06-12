#include "global.h"

#include "ap.h"
#include "bm.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmudisp.h"
#include "bmunit.h"
#include "bmusemind.h"
#include "cgtext.h"
#include "chapterdata.h"
#include "classchg.h"
#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "prepscreen.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "sysutil.h"
#include "uiutils.h"
#include "worldmap.h"

#include "constants/chapters.h"
#include "constants/songs.h"

s8 CheckInLinkArena(void);

void PutPrepChapterSprite_Ruins(int xOam1, int yOam0, int prepChapterNum, u16 oam2)
{
    int chapterNum;

    // If this is a Gaiden chapter (odd prepChapterNum), display "X"
    if (prepChapterNum & 1)
    {
        xOam1 -= 4;
        PutSpriteExt(4, xOam1 + 60, yOam0, SpriteArray_PrepChapterNumbers[10], oam2);
    }

    PutSpriteExt(4, xOam1 + 4, yOam0, Sprite_PrepRuins, oam2);

    // Remove Gaiden bit and extract actual chapter number
    chapterNum = prepChapterNum >> 1;

    if (chapterNum < 10)
        PutSpriteExt(4, xOam1 + 44, yOam0, SpriteArray_PrepChapterNumbers[11], oam2);
    else
        PutSpriteExt(4, xOam1 + 44, yOam0, SpriteArray_PrepChapterNumbers[chapterNum / 10], oam2);

    PutSpriteExt(4, xOam1 + 52, yOam0, SpriteArray_PrepChapterNumbers[chapterNum % 10], oam2);
}
