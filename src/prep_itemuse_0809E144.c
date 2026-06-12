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

bool PrepItemUseTryMoveHand(struct ProcPrepItemUse *proc)
{
    int slot;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        slot = GetUnitItemCount(proc->unit);

        if (proc->slot > 0) {
            proc->slot = proc->slot - 1;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return true;
        }

        if (gKeyStatusPtr->newKeys & DPAD_UP) {
            proc->slot = slot - 1;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return true;
        }

        return false;

    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {

        if (proc->slot < (GetUnitItemCount(proc->unit) - 1)) {
            proc->slot = proc->slot + 1;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return true;
        }

        if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
            proc->slot = 0;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            return true;
        }

        return false;
    }

    return false;
}
