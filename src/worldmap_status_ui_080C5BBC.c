#include "global.h"

#include "fontgrp.h"
#include "statscreen.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "hardware.h"
#include "face.h"
#include "mu.h"
#include "icon.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "helpbox.h"
#include "worldmap.h"
#include "constants/songs.h"

void WorldmapStatus_GetCharDescription(struct HelpBoxProc * proc);
void WorldmapStatus_GetClassDescription(struct HelpBoxProc * proc);

// clang-format off



/* file-scope type definitions used by this run */


struct WorldmapStatusProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ struct MuProc * muProc;
    /* 34 */ struct Text text[2];
};

//! FE8U = 0x080C0DF0
void WorldmapStatus_Init(void)
{
    SetDispEnable(0, 0, 0, 0, 0);
    SetBlendDarken(16);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendBackdropA(1);

    PAL_BG_COLOR(0, 0) = 0;
    EnablePaletteSync();

    return;
}
