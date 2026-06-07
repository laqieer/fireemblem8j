#include "global.h"

#include "bmlib.h"
#include "bmsave.h"
#include "bmudisp.h"
#include "face.h"
#include "fontgrp.h"
#include "hardware.h"
#include "mu.h"
#include "scene.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "proc.h"
#include "event.h"
#include "chapterdata.h"
#include "ap.h"
#include "uiconfig.h"
#include "savemenu.h"
#include "sysutil.h"
#include "unitlistscreen.h"
#include "bmshop.h"

#include "worldmap.h"

#include "constants/songs.h"

// TODO: In "worldmap_scrollmanage.c", the signature returns a ProcPtr instead of s8/bool
s8 GmScrollManageExist(void);

// TODO: Implicit declaration?
void GetWMCenteredCameraPosition(int, int, s16 *, s16 *);

extern u16 * Events_WM_Beginning[];
extern u16 * Events_WM_ChapterIntro[];

struct Proc8A3DD30
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u16 unk_34[0x10];
};

struct Proc8A3DD38
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ u16 unk_34[0x10];
};

struct Proc8A3DD08
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ u8 unk_30;

    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;
    /* 44 */ int unk_44;
};

//! FE8U = 0x080B989C
void WorldMap_ResumeFromGuide(void)
{
    Proc_UnblockEachMarked(PROC_MARK_WMSTUFF);
}

//! FE8U = 0x080B98A8
void WorldMap_RestoreDisplayAfterGuide(struct WorldMapMainProc * proc)
{
    struct GmScreenProc * pScreenProc = proc->gm_screen;

    pScreenProc->unk_2a |= 1;
    pScreenProc->unk_2a |= 6;

    pScreenProc->gmroute->flags |= 3;

    MapUnitC_SetGfxNeedsUpdate(proc->gm_unitc, -1);

    SetDispEnable(1, 1, 1, 1, 1);

    return;
}

//! FE8U = 0x080B98F8
bool WorldMap_StartConfigScreen(ProcPtr proc)
{
    Proc_BlockEachMarked(PROC_MARK_WMSTUFF);
    Proc_StartBlocking(ProcScr_Config_WorldMap, proc);
    return false;
}

//! FE8U = 0x080B9918
void WorldMap_ResumeFromConfigScreen(void)
{
    Proc_UnblockEachMarked(PROC_MARK_WMSTUFF);
    return;
}

//! FE8U = 0x080B9924
void WorldMap_RestoreDisplayAfterConfig(struct WorldMapMainProc * proc)
{
    struct GmScreenProc * pScreenProc = proc->gm_screen;

    pScreenProc->unk_2a |= 1;
    pScreenProc->unk_2a |= 6;

    pScreenProc->gmroute->flags |= 3;

    MapUnitC_SetGfxNeedsUpdate(proc->gm_unitc, -1);

    SetDispEnable(1, 1, 1, 1, 1);

    return;
}

//! FE8U = 0x080B9974
s8 StartWorldmapStatusScreen(ProcPtr proc)
{
    Proc_BlockEachMarked(PROC_MARK_WMSTUFF);
    Proc_StartBlocking(ProcScr_WorldmapStatusUi, proc);
    return 0;
}

//! FE8U = 0x080B9994
void WorldMap_ResumeFromStatusScreen(void)
{
    Proc_UnblockEachMarked(PROC_MARK_WMSTUFF);
    return;
}

//! FE8U = 0x080B99A0
void WorldMap_RestoreDisplayAfterStatus(struct WorldMapMainProc * proc)
{
    struct GmScreenProc * pScreenProc = proc->gm_screen;

    pScreenProc->unk_2a |= 1;
    pScreenProc->unk_2a |= 6;

    pScreenProc->gmroute->flags |= 3;

    MapUnitC_SetGfxNeedsUpdate(proc->gm_unitc, -1);

    SetDispEnable(1, 1, 1, 1, 1);

    return;
}

//! FE8U = 0x080B99F0
void WorldMap_ShowEverything(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
    return;
}

//! FE8U = 0x080B9A10
void WorldMap_HideEverything(void)
{
    SetDispEnable(0, 0, 0, 0, 0);
    return;
}
