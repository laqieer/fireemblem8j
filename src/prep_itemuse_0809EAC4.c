#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "bmbattle.h"
#include "bmudisp.h"
#include "bm.h"
#include "statscreen.h"
#include "scene.h"
#include "face.h"
#include "icon.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "classchg.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"

#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"

bool CheckInLinkArena(void);

// TODO: Implicit declaration?
int CanUnitUseItemPrepScreen(struct Unit* unit, int item);

/* prototypes for same-file helpers called by this run */
bool PrepItemUseTryMoveHand(struct ProcPrepItemUse *proc);
void DrawPrepScreenItemUseDesc(struct Unit *unit, int slot);

void PrepItemUse_CtrlLoop(struct ProcPrepItemUse *proc)
{
    u16 item;

    if (proc->slot_rtext != 0xFF) {
        if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
            CloseHelpBox();
            proc->slot_rtext = 0xFF;
            return;
        }
    } else if (gKeyStatusPtr->newKeys & R_BUTTON) {
        item = proc->unit->items[proc->slot];

        if (item != 0) {
            StartItemHelpBox(0x10, 0x48 + proc->slot * 0x10, item);
            proc->slot_rtext = proc->slot;
        }
        return;

    } else if (gKeyStatusPtr->newKeys & A_BUTTON) {

        if (CanUnitUseItemPrepScreen(proc->unit, proc->unit->items[proc->slot]) != false) {
            proc->unk34 = proc->slot;
            SetUiCursorHandConfig(0, 0x10, 0x10 * proc->slot + 72, 0);
            proc->pos_subbox = 1;
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_CONFIRM);
            return;

        } else {
            PlaySoundEffect(SONG_6C);
            return;
        }

    } else if (gKeyStatusPtr->newKeys & B_BUTTON) {
        Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_EXIT_FADE);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        return;
    }

    if (!PrepItemUseTryMoveHand(proc))
        return;

    ShowSysHandCursor(0x10, proc->slot * 0x10 + 0x48, 0xB, 0x800);
    DrawPrepScreenItemUseDesc(proc->unit, proc->slot);

    if (proc->slot_rtext != 0xFF) {
        item = proc->unit->items[proc->slot];

        if (item != 0) {
            StartItemHelpBox(0x10, 0x48 + proc->slot * 0x10, item);
            proc->slot_rtext = proc->slot;
        }
    }
}
