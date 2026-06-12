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
/* TU-private data externs bound at their JP addresses */
extern struct StatusScreenSt gStatusScreenSt;

//! FE8U = 0x0808E3F4
void ChapterStatus_SetupFont(ProcPtr proc)
{
    ApplyPalette(Pal_Text, 0x1A);

    InitSpriteTextFont(&gStatusScreenSt.font, OBJ_CHR_ADDR(0x3C0), 0x1A);

    SetTextFont(&gStatusScreenSt.font);
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    InitSpriteText(&gStatusScreenSt.th);

    SetTextFont(NULL);

    return;
}
