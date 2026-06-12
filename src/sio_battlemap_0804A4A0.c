#include "global.h"

#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bm.h"
#include "bmio.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "icon.h"
#include "uimenu.h"
#include "bksel.h"
#include "bmbattle.h"
#include "uiutils.h"
#include "bmmind.h"
#include "popup.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "ctc.h"
#include "scene.h"
#include "helpbox.h"
#include "mapanim.h"
#include "ekrbattle.h"
#include "event.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/msg.h"
#include "constants/songs.h"
#include "constants/terrains.h"

//! FE8U = 0x080496A4
void LinkArenaBattleMap_InitChapter(void)
{
    CpuFill16(0, &gBmSt, sizeof(struct BmSt));

    gBmSt.gameStateBits |= BM_FLAG_LINKARENA;

    ClearTraps();

    gPlaySt.faction = FACTION_GREEN;
    gPlaySt.chapterIndex = 0x3a;
    gPlaySt.chapterTurnNumber = 0;

    gPlaySt.chapterVisionRange = GetROMChapterStruct(gPlaySt.chapterIndex)->initialFogLevel;
    gPlaySt.chapterWeatherId = GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather;

    InitChapterMap(0x3a);

    gPlaySt.time_chapter_started = GetGameClock();
    gPlaySt.unk48 = 0;

    return;
}
