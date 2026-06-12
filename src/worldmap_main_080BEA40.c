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

//! FE8U = 0x080B9BA4
void WorldMap_PostBeginningEvent(struct WorldMapMainProc * proc)
{
    if (EventEngineExists())
    {
        return;
    }

    MapRoute_0(proc->gm_screen->gmroute);
    if (!(gGMData.state.raw & GM_STATE_NOFADE))
    {
        SetBlendConfig(0, 0, 0, 0);
        SetBlendTargetA(0, 0, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 0, 0);
        SetBlendBackdropA(0);
        SetBlendBackdropB(0);
    }
    else
    {
        SetDispEnable(0, 0, 0, 0, 0);
    }

    HideWmFace();
    HideWmText();
    EndWMFaceCtrl();
    EndGmMuEntry();
    EndGmapRM();
    EndGmapRmUpdateExt();

    if (gGMData.state.raw & (GM_STATE_SKIPPED | GM_STATE_NOFADE))
    {
        /* Here we may directly jump to intro event */
        Sound_FadeOutBGM(1);
        Sound_FadeOutSE(1);

        proc->unk_3e = gGMData.units[0].location;

        Proc_Goto(proc, 15);
    }
    else
    {
        s16 xCamera;
        s16 yCamera;

        int x = gGMData.units[0].location[gWMNodeData].x;
        int y = gGMData.units[0].location[gWMNodeData].y;

        gGMData.ix = x << 8;
        gGMData.iy = y << 8;

        GetWMCenteredCameraPosition(x, y, &xCamera, &yCamera);

        gGMData.xCamera = xCamera;
        gGMData.yCamera = yCamera;

        Proc_Break(proc);
    }
}
