#include "global.h"
#include "classchg.h"
#include "uimenu.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "proc.h"
#include "hardware.h"
#include "bmarch.h"
#include "scene.h"
#include "constants/classes.h"




u8 ClassChgMenuItem_OnSelect(struct MenuProc *pmenu, struct MenuItemProc *pmitem) {
    struct ProcClassChgMenuSel *parent;
    struct ProcPromoSel *gparent;
    struct ProcPromoMain *ggparent;

    parent = pmenu->proc_parent;
    gparent = parent->proc_parent;
    ggparent = gparent->proc_parent;
    if (gparent->stat == 0) {
        struct Unit *unit = GetUnitFromCharId(ggparent->pid);
        u8 classnumber = unit->pClassData->number;
        if (pmitem->itemNumber <= 1) {
            classnumber = gPromoJidLut[classnumber][pmitem->itemNumber];
            ggparent->jid = classnumber;
        } else {
            if (pmitem->itemNumber == 2) {
                switch (classnumber) {
                case CLASS_JOURNEYMAN:
                    ggparent->jid = CLASS_JOURNEYMAN_T1;
                    break;
                case CLASS_PUPIL:
                    ggparent->jid = CLASS_PUPIL_T1;
                    break;
                case CLASS_RECRUIT:
                    ggparent->jid = CLASS_RECRUIT_T1;
                    break;
                default:
                    ggparent->jid = classnumber;
                    break;
                }
            }
        }

        switch ((u8) ggparent->jid) {
        case CLASS_RANGER:
        case CLASS_RANGER_F:
            if (unit->state & US_IN_BALLISTA) {
                TryRemoveUnitFromBallista(unit);
            }
            break;
        }

        InitTextFont(&gFontClassChgMenu, (void *)BG_VRAM + 0x1000, 0x80, 0x5);
        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 4), 0xA, 0x6, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT);
        StartMenuExt(&Menu_PromoSubConfirm, 2, 0, 0, 0, pmenu);
    }

    return 0;
}
