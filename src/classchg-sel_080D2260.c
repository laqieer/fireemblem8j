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

u8 LoadClassBattleSprite(s16 * out, u16 jid, u16 wpn_before) 
{
    u8 i;
    const struct BattleAnimDef * anim_instr = GetClassData(jid)->pBattleAnimDef;
    u32 item_type = GetItemType(wpn_before);
    u16 expected_type = item_type + 0x100;
    u8 ret;

    *out = 0;
    for (i = 0; ; i++) {
        u16 item = anim_instr[i].wtype;
        if (item == expected_type)
            *out = anim_instr[i].index - 1;

        if (anim_instr[i].index == 0)
            break;
    }

    if (*out == 0) {
        u32 key = SPECIAL_BANIM_WTYPE;
        for (i = 0; ; i++) {
            if (anim_instr[i].wtype == key)
                *out = anim_instr[i].index - 1;

            if (anim_instr[i].index == 0)
                break;
        }
    }

    if (wpn_before == 0)
        return false;

    if (GetItemRequiredExp(wpn_before) >= GetClassData(jid)->baseRanks[GetItemType(wpn_before)])
        return true;

    return false;
}
