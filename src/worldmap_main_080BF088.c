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

//! FE8U = 0x080BA1F4
void WorldMap_FadeMapSpritePalIn_Loop(struct Proc8A3DD38 * proc)
{
    int i;

    u16 * palIt = &PAL_COLOR(proc->unk_30, 1);
    u16 * it = proc->unk_34;

    proc->unk_2c++;

    for (i = 1; i < 0x10; i++)
    {
        *palIt = ((((*it & 0x1f) * proc->unk_2c) >> 5) & 0x1f) + (((proc->unk_2c * (*it & 0x3e0)) >> 5) & 0x3e0) +
            (((proc->unk_2c * (*it & 0x7c00)) >> 5) & 0x7c00);
        it++;
        palIt++;
    }

    EnablePaletteSync();

    if (proc->unk_2c == 0x20)
    {
        Proc_Break(proc);
    }

    return;
}
