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

void TargetSelection_Unfreeze(void) {
    struct SelectTargetProc * proc = Proc_Find(gProcScr_TargetSelection);
    if (proc) {
        proc->flags &= ~TARGETSELECTION_FLAG_FROZEN;
    }
}
