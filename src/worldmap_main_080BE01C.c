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

/* prototypes for same-file helpers called by this run */
void SetupGraphicSystemsForWorldMap(void);
void WorldMap_SetupBgGfx(struct WorldMapMainProc * proc);
void DeployEveryUnit(struct WorldMapMainProc * unused);
void WorldMap_SetNextNodeIcon(struct WorldMapMainProc * proc);
void WorldMap_ResetMapUnits(struct WorldMapMainProc * proc);
void WorldMap_SetMergedNodeIcon(struct WorldMapMainProc * proc);

//! FE8U = 0x080B9154
void WorldMap_Init(struct WorldMapMainProc * proc)
{
    SetupGraphicSystemsForWorldMap();

    WorldMap_SetupBgGfx(proc);
    DeployEveryUnit(proc);

    proc->gm_screen = NewMapScreen(PROC_TREE_5);
    proc->gm_icon = StartGmNodeIconDisplay(PROC_TREE_5, 0, 3, 10, proc->gm_screen);
    proc->gm_unitc = NewGmapUnitContainer(proc->gm_screen, 0x280, 0xc);
    proc->gm_cursor = NewGmapCursor(PROC_TREE_5, 0x12c0, 4, proc->gm_screen);
    proc->gm_mu = StartGmMu(proc);

    RefreshGmNodeLinks(&gGMData);
    StartWmTextHandler(proc);
    WorldMap_SetNextNodeIcon(proc);
    WorldMap_ResetMapUnits(proc);

    if (gGMData.state.bits.monster_merged)
    {
        WorldMap_SetMergedNodeIcon(proc);
    }

    proc->gm_screen->gmroute->flags |= 3;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME)
    {
        ResetGmStoryNode();
        proc->gm_icon->merge_next_node = false;
    }

    proc->delay_timer = 0;
}
