#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "helpbox.h"
#include "face.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "constants/video-global.h"
#include "bmlib.h"
#include "sysutil.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "prepscreen.h"
#include "constants/songs.h"
s8 PrepCheckCanSelectUnit(struct ProcPrepUnit *proc, struct Unit *unit);
s8 PrepCheckCanUnselectUnit(struct ProcPrepUnit *proc, struct Unit *unit);

//! FE8U = 0x0809CF80
s8 PrepUnit_HandlePressA(struct ProcPrepUnit *proc)
{
    struct Unit *unit = GetUnitFromPrepList(proc->list_num_cur);

    if (unit->state & US_BIT25) {
        u32 ilist = proc->list_num_cur;
        StartPrepErrorHelpbox(
            (ilist & 1) * 56 + 0x70,
            (ilist / 2) * 16 - proc->yDiff_cur + 0x18,
            0x700,
            proc
        );
        return 0;
    }

    if (unit->state & US_NOT_DEPLOYED) {
        if (CheckInLinkArena() && !CanUnitBeDeployedLinkArena(unit)) {
            u32 ilist = proc->list_num_cur;
            StartPrepErrorHelpbox(
                (ilist & 1) * 56 + 0x70,
                (ilist / 2) * 16 - proc->yDiff_cur + 0x18,
                0x6FD,
                proc
            );
            return 0;
        }

        if (CheckInLinkArena() && !CanUnitJoinLinkArena(unit)) {
            u32 ilist = proc->list_num_cur;
            StartPrepErrorHelpbox(
                (ilist & 1) * 56 + 0x70,
                (ilist / 2) * 16 - proc->yDiff_cur + 0x18,
                0x6FB,
                proc
            );
            return 0;
        }

        if (PrepCheckCanSelectUnit(proc, unit) == 0)
            return 0;
        else
            return 1;

    } else {
        if (PrepCheckCanUnselectUnit(proc, unit) == 0)
            return 0;
        else
            return 1;
    }
}
