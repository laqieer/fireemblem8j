#include "global.h"
#include "classchg.h"
#include "proc.h"
#include "hardware.h"
#include "scene.h"
#include "classdisplayfont.h"
#include "constants/video-global.h"
#include "constants/classes.h"
#include "bmlib.h"
#include "ctc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmsave.h"
#include "bm.h"
#include "bmmind.h"
#include "bmio.h"
#include "bmmap.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmitem.h"
#include "prepscreen.h"

void EndBanimTerrain(void *);
void InitBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

/* file-scope type definitions used by this run */


struct Struct_8A30978 {
    u8 a;
    u8 b; // Accessed indirectly, strangely
    u16 longBuffer[0x4B2];
};

void ClassChgSelDrawPidName(struct ProcPromoSel *proc) {
    u8 _pad_[0x16];
    const struct ClassData *class;
    char *string;

    DrawUiFrame(gBG2TilemapBuffer, 2, 1, 10, 6, 0, 1);
    SetTextFontGlyphs(0);
    SetTextFont(0);

    PutDrawText(
        NULL,
        TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 2),
        TEXT_COLOR_SYSTEM_WHITE, 0, 0x8,
        GetStringFromIndex(GetClassData(proc->jid[0])->nameTextId)
    );

    PutDrawText(
        NULL,
        TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 4),
        TEXT_COLOR_SYSTEM_WHITE, 0, 0x8,
        GetStringFromIndex(GetClassData(proc->jid[1])->nameTextId)
    );
}
