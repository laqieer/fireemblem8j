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
/* TU-private data externs bound at their JP addresses */
extern u8 gSioBattlemap_1[];

void LinkArenaBattleMap_InitMap(void);

// clang-format on

//! FE8U = 0x08049828
void LinkArenaBattleMap_Init(void)
{
    int i;
    struct Unit * unit;

    SetupBackgrounds(NULL);
    ClearSioBG();

    LinkArenaBattleMap_InitMap();
    LinkArenaBattleMap_CountTeamUnits();

    gUnk_Sio_16.unk_09 = 0;
    gLinkArenaSt.unk_0B = 0;

    LinkArenaBattleMap_AdvancePhase(gSioBattlemap_1[gUnk_Sio_16.unk_00]);

    gUnk_Sio_16.unk_0E = 1;
    gUnk_Sio_16.unk_02 = 0;
    gUnk_Sio_16.unk_03 = 1;

    for (i = 0; i < 4; i++)
    {
        gUnk_Sio_16.currentScore[i] = 0;
    }

    unit = GetUnit(gUnk_42[3]);

    gUnk_43.x = unit->xPos * 16;
    gUnk_43.y = unit->yPos * 16;

    SetCursorMapPosition(unit->xPos, unit->yPos);

    gBmSt.camera.x = 0;
    gBmSt.camera.y = 0;

    ReadGameSaveCoreGfx();

    ApplyUnitSpritePalettes();
    ResetUnitSprites();
    RefreshUnitSprites();

    LoadLinkArenaFogPlaceholder();
    StartLinkArenaFogPlaceholders();

    Proc_Start(gProc_MapTask, PROC_TREE_4);
    BMapVSync_Start();
    LinkArenaBattleMap_InitConfig();

    gPlaySt.chapterStateBits &= ~PLAY_FLAG_HARD;

    return;
}
