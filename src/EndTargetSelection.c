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

ProcPtr EndTargetSelection(struct SelectTargetProc* proc) {
    if (proc->selectRoutines->onEnd) {
        proc->selectRoutines->onEnd(proc);
    }

    if ((TARGETSELECTION_FLAG_GAMELOCK & proc->flags) != 0) {
        UnlockGame();
    }

    Proc_End(proc);

    return proc->proc_parent;
}
