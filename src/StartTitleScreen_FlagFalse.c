#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "bm.h"
#include "opanim.h"
#include "sysutil.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_TitleScreen[];

//! FE8U = 0x080C6444
void StartTitleScreen_FlagFalse(ProcPtr parent) {
    struct TitleScreenProc* proc;

    proc = Proc_StartBlocking(gProcScr_TitleScreen, parent);
    proc->mode = 0;
}
