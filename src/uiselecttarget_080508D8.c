#include "global.h"

#include "functions.h"
#include "m4a.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "bmio.h"
#include "face.h"
#include "bm.h"

#include "uiselecttarget.h"
#include "constants/songs.h"







extern struct ProcCmd CONST_DATA gProcScr_TargetSelection[];

struct Unk_085B658C
{
    s8 x, y;
};

extern struct Unk_085B658C CONST_DATA gNearTargetLinkOrder[];

int TargetSelection_HandleSelectInput(struct SelectTargetProc* proc) {
    int ret = 0;

    if (A_BUTTON & gKeyStatusPtr->newKeys) {
        if (proc->onAPress) {
            ret = proc->onAPress(proc, proc->currentTarget);
        } else {
            if (proc->selectRoutines->onSelect) {
                ret = proc->selectRoutines->onSelect(proc, proc->currentTarget);
            }
        }
    } else if (B_BUTTON & gKeyStatusPtr->newKeys) {
        if (proc->selectRoutines->onCancel) {
            ret = proc->selectRoutines->onCancel(proc, proc->currentTarget);
        }
    } else if (R_BUTTON & gKeyStatusPtr->newKeys) {
        if (proc->selectRoutines->onHelp) {
            ret = proc->selectRoutines->onHelp(proc, proc->currentTarget);
        }
    }

    return ret;
}
