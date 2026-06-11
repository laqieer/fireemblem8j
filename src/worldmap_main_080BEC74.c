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

//! FE8U = 0x080B9DE0
void Worlmap_StartGmapSogu(struct WorldMapMainProc * proc)
{
    s16 x;
    s16 y;

    GmMu_GetPosition(proc->gm_mu, 0, &x, &y);
    NewGmapSogu(x, y);

    x = gGMData.units[0].location[gWMNodeData].x;
    y = gGMData.units[0].location[gWMNodeData].y;

    gGMData.ix = x << 8;
    gGMData.iy = y << 8;

    return;
}

//! FE8U = 0x080B9E40
void Worlmap_WaitGmapSogu(ProcPtr proc)
{
    if (!GmapSoguExists())
    {
        gGMData.sprite_disp = 1;
        Proc_Break(proc);
    }
    return;
}

//! FE8U = 0x080B9E64
void WorldMap_HideFaceAndCenterCamera(void)
{
    s16 x;
    s16 y;

    HideWmFace();
    HideWmText();
    EndWMFaceCtrl();

    *&x = (gGMData.xCamera);
    *&y = (gGMData.yCamera);

    gGMData.ix = (x + 120) << 8;
    gGMData.iy = (y + 80) << 8;

    return;
}

//! FE8U = 0x080B9EA4
void ResetWorldMapScreen(void)
{
    SetDispEnable(0, 0, 0, 0, 0);

    SetBlendConfig(0, 0, 0, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    Sound_FadeOutBGM(1);
    Sound_FadeOutSE(1);

    return;
}
