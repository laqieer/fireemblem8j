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
extern EWRAM_OVERLAY(0) struct Font gBmdifficulty_1;
extern EWRAM_OVERLAY(0) int gBmdifficulty_2;
extern EWRAM_OVERLAY(0) struct Struct020038C8 gBmdifficulty_3[2];
extern EWRAM_OVERLAY(0) struct Text gBmdifficulty_4[8];

extern const struct Outer080D7FD0 gBmdifficulty_6;

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

void DungeonRecordUi_CopyDigitsToObjVram(struct Text* th) {
    int i;
    int bgOffset;

    bgOffset = GetBackgroundTileDataOffset(0);

    i = 0;

    while (i < 8) {
        if (th->chr_position == 0xFFFF) {
            CpuFastFill(0, (void *)((BG_VRAM + 0x12000) + (0x20 * i)), 32);
            CpuFastFill(0, (void *)((BG_VRAM + 0x12400) + (0x20 * i)), 32);
        } else {
            int base = (BG_VRAM + (th->chr_position * 0x40));
            int src = bgOffset + base;

            src += 0x20;
            CpuFastCopy((void *)(src), (void *)((BG_VRAM + 0x12000) + (0x20 * i)), 32);

            src += 0x20;
            CpuFastCopy((void *)(src), (void *)((BG_VRAM + 0x12400) + (0x20 * i)), 32);
        }

        th++;
        i++;
    }

    return;
}
