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

void TargetSelection_HandleMoveInput(struct SelectTargetProc* proc) {
    struct SelectTarget* current = proc->currentTarget;

    if ((DPAD_LEFT | DPAD_UP) & gKeyStatusPtr->repeatedKeys) {
        if (current->next != 0) {
            proc->currentTarget = current->next;
        }
    }

    if ((DPAD_RIGHT | DPAD_DOWN) & gKeyStatusPtr->repeatedKeys) {
        if (proc->currentTarget->prev) {
            proc->currentTarget = proc->currentTarget->prev;
        }
    }

    if (proc->currentTarget == current) {
        return;
    }

    if (proc->selectRoutines->onSwitchOut) {
        proc->selectRoutines->onSwitchOut(proc, current);
    }

    if (proc->selectRoutines->onSwitchIn) {
        proc->selectRoutines->onSwitchIn(proc, proc->currentTarget);
    }

    PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
}
