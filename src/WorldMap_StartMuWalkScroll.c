extern int GetWMCenteredCameraPosition();
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

//! FE8U = 0x080B8A7C
void WorldMap_StartMuWalkScroll(struct WorldMapMainProc * proc)
{
    int unk;
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;

    proc->unk_40 = 0;
    proc->unk_41 = 0;

    proc->flags_1 = 1;

    gGMData.sprite_disp = 0;

    GmMu_GetRawPosition(proc->gm_mu, 0, &x1, &y1);
    GetWMCenteredCameraPosition(x1, y1 - 14, &x2, &y2);

    unk = GetWMPointDistance(gGMData.xCamera, gGMData.yCamera, x2, y2, 2);

    unk = unk >> 2;

    if (unk < 2)
    {
        gGMData.xCamera = x2;
        gGMData.yCamera = y2;
        Proc_Goto(proc, 7);
    }
    else
    {
        if (unk < 16)
        {
            unk = 16;
        }
        else if (unk > 75)
        {
            unk = 75;
        }
        StartGmScroll(-1, -1, x2, y2, unk, 0);
    }

    return;
}
