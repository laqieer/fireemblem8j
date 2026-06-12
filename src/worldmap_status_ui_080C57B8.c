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

struct HelpBoxInfo CONST_DATA gHelpInfo_WorldmapStatus[] =
{
    {
        .adjUp = NULL,
        .adjDown = &gHelpInfo_WorldmapStatus[1],
        .adjLeft = &gHelpInfo_WorldmapStatus[6],
        .adjRight = NULL,
        .xDisplay = 168,
        .yDisplay = 80,
        .mid = 0x0000,
        .redirect = NULL,
        .populate = WorldmapStatus_GetCharDescription,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[0],
        .adjDown = &gHelpInfo_WorldmapStatus[2],
        .adjLeft = &gHelpInfo_WorldmapStatus[7],
        .adjRight = NULL,
        .xDisplay = 136,
        .yDisplay = 104,
        .mid = 0x06E8, // TODO: msgid "The unit's class. Each class[NL]possesses unique traits."
        .redirect = NULL,
        .populate = WorldmapStatus_GetClassDescription,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[1],
        .adjDown = &gHelpInfo_WorldmapStatus[4],
        .adjLeft = &gHelpInfo_WorldmapStatus[8],
        .adjRight = &gHelpInfo_WorldmapStatus[3],
        .xDisplay = 136,
        .yDisplay = 120,
        .mid = 0x0542, // TODO: msgid "Unit level. The unit becomes[NL]stronger as it gains levels."
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[1],
        .adjDown = &gHelpInfo_WorldmapStatus[4],
        .adjLeft = &gHelpInfo_WorldmapStatus[2],
        .adjRight = NULL,
        .xDisplay = 168,
        .yDisplay = 120,
        .mid = 0x0543, // TODO: msgid "Experience points gained. Gain[NL]100 points to earn a new level.[.]"
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[2],
        .adjDown = NULL,
        .adjLeft = &gHelpInfo_WorldmapStatus[8],
        .adjRight = NULL,
        .xDisplay = 136,
        .yDisplay = 136,
        .mid = 0x0544, // TODO: msgid "Unit hit points. The unit loses[.][NL]consciousness if this reaches 0."
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = NULL,
        .adjDown = &gHelpInfo_WorldmapStatus[6],
        .adjLeft = NULL,
        .adjRight = &gHelpInfo_WorldmapStatus[0],
        .xDisplay = 32,
        .yDisplay = 48,
        .mid = 0x0676, // TODO: msgid "The party's next destination.[.]"
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[5],
        .adjDown = &gHelpInfo_WorldmapStatus[7],
        .adjLeft = NULL,
        .adjRight = &gHelpInfo_WorldmapStatus[0],
        .xDisplay = 16,
        .yDisplay = 72,
        .mid = 0x0677, // TODO: msgid "The current number of units."
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[6],
        .adjDown = &gHelpInfo_WorldmapStatus[8],
        .adjLeft = NULL,
        .adjRight = &gHelpInfo_WorldmapStatus[1],
        .xDisplay = 16,
        .yDisplay = 88,
        .mid = 0x06F3, // TODO: msgid "Money on hand."
        .redirect = NULL,
        .populate = NULL,
    },
    {
        .adjUp = &gHelpInfo_WorldmapStatus[7],
        .adjDown = NULL,
        .adjLeft = NULL,
        .adjRight = &gHelpInfo_WorldmapStatus[4],
        .xDisplay = 24,
        .yDisplay = 120,
        .mid = 0x06F0, // TODO: msgid "Total time played."
        .redirect = NULL,
        .populate = NULL,
    },
};

/* file-scope type definitions used by this run */


struct WorldmapStatusProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ struct MuProc * muProc;
    /* 34 */ struct Text text[2];
};

// clang-format on

//! FE8U = 0x080C09EC
void StartWorldmapStatusHelpBox(ProcPtr proc)
{
    LoadHelpBoxGfx((void *)0x06013000, 9);
    StartMovingHelpBox(gHelpInfo_WorldmapStatus, proc);
    return;
}
