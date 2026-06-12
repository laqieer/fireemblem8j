extern int EndMenuScrollBar();
#include "global.h"
#include "eventinfo.h"
#include "bmshop.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmlib.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bm.h"
#include "bmguide.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_Guide_DrawSprites[];

//! FE8U = 0x080CF448
void Guide_OnEnd(void)
{
    EndMuralBackground();
    Proc_EndEach(gProcScr_Guide_DrawSprites);
    EndMenuScrollBar();
    return;
}
