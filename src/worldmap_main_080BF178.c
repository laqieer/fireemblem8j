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
void WorldMap_RestartWithTimer(int unk);

//! FE8U = 0x080BA2E4
void NewWorldMap(void)
{
    struct WorldMapMainProc * proc = Proc_Start(ProcScr_WorldMapMain, PROC_TREE_3);

    proc->flags_1 = 0;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME)
        proc->timer = 4;
    else
    {
        if (gGMData.state.bits.monster_merged)
            proc->timer = 12;
        else
            proc->timer = 16;
    }
}

//! FE8U = 0x080BA334
void WorldMap_CallBeginningEvent(struct WorldMapMainProc * proc)
{
    int chIndex;
    int node_next;

    Sound_FadeOutBGM(4);

    if ((gGMData.state.bits.monster_merged) || (gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME))
    {
        WorldMap_RestartWithTimer(proc->timer);
    }
    else
    {
        int loc = gGMData.units[0].location;

        gGMData.current_node = loc;
        node_next = WMLoc_GetNextLocId(loc);

        if (node_next > -1)
        {
            chIndex = WMLoc_GetChapterId(node_next);

            gPlaySt.chapterIndex = chIndex;

            if (Events_WM_Beginning[GetROMChapterStruct(chIndex)->gmapEventId] == NULL)
                return;

            ResetGmStoryNode();
            proc->gm_icon->merge_next_node = false;
            CallEvent(Events_WM_Beginning[GetROMChapterStruct(chIndex)->gmapEventId], 0);
        }
    }

    StartWMFaceCtrl(proc);
    StartGmapMuEntry(NULL);
}

//! FE8U = 0x080BA3D4
void CallChapterWMIntroEvents(ProcPtr proc)
{
    if (Events_WM_ChapterIntro[GetROMChapterStruct(gPlaySt.chapterIndex)->gmapEventId] != NULL)
    {
        CallEvent(Events_WM_ChapterIntro[GetROMChapterStruct(gPlaySt.chapterIndex)->gmapEventId], 0);
        StartWMFaceCtrl(proc);
        StartGmapMuEntry(NULL);
    }
}
