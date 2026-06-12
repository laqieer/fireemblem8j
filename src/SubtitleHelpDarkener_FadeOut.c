#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "bm.h"
#include "bb.h"

void SubtitleHelpDarkener_FadeOut(struct SubtitleHelpProc * proc)
{
    gBmSt.altBlendACa++;

    if (gBmSt.altBlendACa == 8) {
        SetPrimaryHBlankHandler(0);
        Proc_Break(proc);
    }

    return;
}
