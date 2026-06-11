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
void WorldMap_UpdateBgm(ProcPtr unused);

//! FE8U = 0x080B9FC0
void UpdateWorldMapBgm(void)
{
    WorldMap_UpdateBgm(Proc_Find(ProcScr_WorldMapMain));
    return;
}

//! FE8U = 0x080B9FD4
void WorldMap_PrepareSaveMenu(ProcPtr unused)
{
    int mapLocation = GetNextUnclearedNode(&gGMData);

    if (mapLocation < 0)
    {
        mapLocation = 0;
    }

    gPlaySt.chapterIndex = WMLoc_GetChapterId(mapLocation);
    gPlaySt.save_menu_type = 1;

    return;
}

//! FE8U = 0x080BA008
void WorldMap_RestartWithTimer(int unk)
{
    struct WorldMapMainProc * proc = Proc_Find(ProcScr_WorldMapMain);
    proc->timer = unk;
    Proc_Goto(proc, 0);

    return;
}

//! FE8U = 0x080BA024
void EndWM(ProcPtr unused)
{
    Proc_End(Proc_Find(ProcScr_BmFadeIN));
    Proc_End(Proc_Find(ProcScr_WorldMapMain));
    ResetDialogueScreen();
    APProc_DeleteAll();
    SetupBackgrounds(NULL);
    return;
}

//! FE8U = 0x080BA054
s8 WM_Exists(void)
{
    return (Proc_Find(ProcScr_WorldMapMain) != 0) ? 1 : 0;
}

//! FE8U = 0x080BA06C
void WorldMap_MergeFace_Loop(struct Proc8A3DD08 * proc)
{
    if (proc->unk_2c > 0)
    {
        proc->unk_2c--;
        return;
    }

    switch (proc->unk_30)
    {
        case 6:
            WmDrawFace(proc->unk_34, proc->unk_40, proc->unk_44);
            break;

        case 7:
            WmClearFace(proc->unk_34, proc->unk_44);
            break;
    }

    Proc_Break(proc);

    return;
}
