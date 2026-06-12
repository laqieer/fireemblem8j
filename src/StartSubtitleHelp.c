#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "bm.h"
#include "bb.h"

void StartSubtitleHelp(ProcPtr parent, const char * string) {

    if (gPlaySt.config.noSubtitleHelp != 1) {
        struct SubtitleHelpProc* proc = Proc_Start(gProcScr_SubtitleHelp, parent);

        proc->string = string;

        InitSubtitleHelpText(proc);

        BlankTilesetConfigTiles();

        gBmSt.cameraMax.y += 16;
    }

    return;
}
