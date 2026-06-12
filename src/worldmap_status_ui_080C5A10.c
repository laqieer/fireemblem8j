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

/* prototypes for same-file helpers called by this run */
void PutWorldmapStatusDetails(struct WorldmapStatusProc * proc);
void WorldmapStatus_InitText(struct WorldmapStatusProc * proc);

//! FE8U = 0x080C0C44
void WorldmapStatus_InitDetails(struct WorldmapStatusProc * proc)
{
    int pid;
    int fid;
    struct Unit * unit;

    if (!(gGMData.units[0].state & 2))
    {
        pid = gGMData.units[0].id;
    }
    else
    {
        pid = 0;
    }

    unit = GetUnitFromCharId(pid);

    proc->unit = unit;

    fid = GetUnitPortraitId(unit);
    if (proc->unit->state & US_BIT23)
    {
        fid = fid + 1;
    }

    ResetText();
    ResetIconGraphics_();

    WorldmapStatus_InitText(proc);

    PutFace80x72(proc, TILEMAP_LOCATED(gBG2TilemapBuffer, 18, 1), fid, 0x200, 0xd);

    if (GetPortraitData(fid)->img)
    {
        ApplyPalette(gUnkData_30, 2);
    }
    else
    {
        ApplyPalette(gUnkData_31, 2);
    }

    EndAllMus();
    proc->muProc = StartUiMu(proc->unit, 216, 135);

    PutWorldmapStatusDetails(proc);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}
