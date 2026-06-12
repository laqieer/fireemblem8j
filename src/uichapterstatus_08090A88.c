#include "global.h"
#include "bmunit.h"
#include "hardware.h"
#include "fontgrp.h"
#include "scene.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"
#include "uichapterstatus.h"
#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x0808E7B4
void StatusScreenSpriteDraw_Init(struct ChapterStatusProc * proc)
{
    LoadObjUIGfx();

    ApplyPalette(Pal_StatusScreenLabelSprites, 0x14);
    ApplyPalette(Pal_MenuStatus_0, 0x17);

    Decompress(Img_StatusScreenLabelSprites, OBJ_CHR_ADDR(0x340));

    proc->unk_64 = 0;

    ApplyChapterTitlePal(0x80, 0x13);
    PutChapterTitleGfx(0xB80, GetChapterTitleWM(&gPlaySt));

    return;
}
