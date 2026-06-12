#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_OpSubtitle[];

//! FE8U = 0x080C541C
void StartIntroMonologue(ProcPtr proc) {
    Proc_StartBlocking(gProcScr_OpSubtitle, proc);

    return;
}
