#include "global.h"

#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

void BmBgfxAdvance(void)
{
    struct ProcBmBgfx * proc = Proc_Find(ProcScr_BmBgfx);
    if ((proc != NULL) && (proc->conf->type == BMFX_CONFT_BLOCKING))
        proc->conf++;
}

void EndBmBgfx(void)
{
    Proc_End(Proc_Find(ProcScr_BmBgfx));
}
