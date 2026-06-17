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


struct Struct_8A30978 {
    u8 a;
    u8 b; // Accessed indirectly, strangely
    u16 longBuffer[0x4B2];
};

void Make6C_PromotionMenuSelect(struct ProcPromoSel* proc) {
    struct ProcPromoMain *parent = proc->proc_parent;
    struct ProcPromoHandler *grandparent;
    struct Unit *unit;
    int i, pid;

    parent->stat = PROMO_MAIN_STAT_2;
    proc->pid = parent->pid;
    proc->u50 = 9;
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    ClassChgSel_StartClassBattleSprite(0, -1, 0xfb * 2, 0x58, 6);
    ClassChgLoadUI();
    ClassChgSel_SetupBattleTerrain(proc->u50, 0x8c * 2, 0x68);

    proc->sprite[0] = 0;
    proc->sprite[1] = 0;
    proc->sprite[2] = 0;

    for (i = 1; i < 0x40; i++) {
        u16 classFromSwitch;

        u16 weapon;
        s32 j;
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->pCharacterData->number !=  proc->pid)
            continue;

        pid = unit->pClassData->number;
        weapon = GetUnitEquippedWeapon(unit);

        for (j = 0; j < 2; j++) {
            proc->jid[j] = gPromoJidLut[pid][j];
            proc->use_wpn[j] = LoadClassBattleSprite(&proc->sprite[j], gPromoJidLut[pid][j], weapon);
            proc->msg_desc[j] = GetClassData(gPromoJidLut[pid][j])->descTextId;
        }

        proc->weapon = weapon;

        if (Check3rdTraineeEnabled()) {
            pid = unit->pClassData->number;
            switch (pid) {
            case CLASS_JOURNEYMAN:
                proc->jid[2] = CLASS_JOURNEYMAN_T1;
                proc->use_wpn[2] = LoadClassBattleSprite(&proc->sprite[2], CLASS_JOURNEYMAN_T1, weapon);
                proc->msg_desc[2] = GetClassData(CLASS_JOURNEYMAN_T1)->descTextId;
                break;

            case CLASS_PUPIL:
                proc->jid[2] = CLASS_PUPIL_T1;
                proc->use_wpn[2] = LoadClassBattleSprite(&proc->sprite[2], CLASS_PUPIL_T1, weapon);
                proc->msg_desc[2] = GetClassData(CLASS_PUPIL_T1)->descTextId;
                break;

            case CLASS_RECRUIT:
                proc->jid[2] = CLASS_RECRUIT_T1;
                proc->use_wpn[2] = LoadClassBattleSprite(&proc->sprite[2], CLASS_RECRUIT_T1, weapon);
                proc->msg_desc[2] = GetClassData(CLASS_RECRUIT_T1)->descTextId;
                break;
            }
        }
        break;
    }

    if (proc->sprite[0] == 0 && proc->sprite[1] == 0) {
        proc->sprite[1] = 0;
        proc->sprite[0] = 0;
    }

    proc->stat = 1;
    proc->main_select = 0;
    LoadClassReelFontPalette(proc, pid);
    LoadClassNameInClassReelFont(proc);
    LoadObjUIGfx();

    proc->menu_proc = NewClassChgMenuSelect(proc);

    grandparent = parent->proc_parent;
    if (grandparent->bmtype == PROMO_HANDLER_TYPE_BM) {
        RestartMuralBackground();
        BG_EnableSyncByMask(0xf);
    }
}
