#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "bm.h"
#include "bb.h"




void SubtitleHelp_Init(struct SubtitleHelpProc * proc)
{
    proc->textOffset = 31;
    proc->textShowCnt = 6;

    Proc_Start(gProcScr_SubtitleHelpDarkener, PROC_TREE_3);

    return;
}
