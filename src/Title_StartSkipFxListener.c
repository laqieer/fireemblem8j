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
extern struct ProcCmd gProcScr_SkipTitleFxKeyListener[];

//! FE8U = 0x080C55A4
void Title_StartSkipFxListener(ProcPtr proc) {
    Proc_Start(gProcScr_SkipTitleFxKeyListener, proc);

    return;
}
