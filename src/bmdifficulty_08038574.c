#include "global.h"

#include "constants/characters.h"

#include "bmunit.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "bmio.h"
#include "mu.h"
#include "bm.h"
#include "bmsave.h"
#include "popup.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "savemenu.h"
#include "spline.h"
#include "sysutil.h"
#include "bmdifficulty.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(0) u16 gBmdifficulty_0[0x3D0];
extern EWRAM_OVERLAY(0) int gBmdifficulty_2;

const struct Outer080D7FD0 gBmdifficulty_6 = {
    {
        { 0x10, 0x09, 0, 5, },
        { 0x10, 0x0B, 0, 5, },
        { 0x10, 0x0D, 0, 3, },
        { 0x10, 0x0F, 0, 3, },
    },
    0x10,
    0x11,
    {
        { 0x1A, 0x09, 0, 5, },
        { 0x1A, 0x0B, 0, 5, },
        { 0x1A, 0x0D, 0, 3, },
        { 0x1A, 0x0F, 0, 3, },
    },
    0x1A,
    0x11,
};

/* file-scope type definitions used by this run */


struct PostgameUnitLutEntry {
    u16 eid;
    struct UnitDefinition* uDef;
};

struct DungeonUiTextLutEntry {
    /* 00 */ u16 msgId;
    /* 02 */ s8 x;
    /* 03 */ s8 y;
};

void DrawDungeonRecordUiLabels(struct Text* th) {
    char* str;
    struct DungeonUiTextLutEntry* iter;

    struct DungeonUiTextLutEntry uiTextLut[9] = {
        { 0x205, 13,  5 }, // Current[.]
        { 0x206, 23,  5 }, // Record
        { 0x207,  3,  7 }, // # Cleared
        { 0x208,  3,  9 }, // Monsters
        { 0x209,  3, 11 }, // Exp[.]
        { 0x20A,  3, 13 }, // Units Used
        { 0x20B,  3, 15 }, // Turns[.]
        { 0x20C,  3, 17 }, // Time
        { },
    };

    iter = &uiTextLut[0];
    while (iter->msgId != 0) {
        str = GetStringFromIndex(iter->msgId);

        InitText(th, strlen(str));
        Text_SetParams(th, 0, 0);
        Text_DrawString(th, str);
        PutText(th, &gBG0TilemapBuffer[TILEMAP_INDEX(iter->x, iter->y)]);

        iter++;
    }

    return;
}
