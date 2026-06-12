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
extern struct ProcCmd gProcScr_DrawTitleSprites[];

//! FE8U = 0x080C5848
void TitleScreenTryJumpIntroAnim(struct TitleScreenProc * proc)
{
    if (proc->mode != 0)
        Proc_Goto(proc, 0);
    else
        Proc_Start(gProcScr_DrawTitleSprites, proc);
}
