#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "bm.h"
#include "bb.h"

/* prototypes for same-file helpers called by this run */
void InitSubtitleHelpText(struct SubtitleHelpProc * proc);

void EndSubtitleHelp() {
    Proc_EndEach(gProcScr_SubtitleHelp);
    return;
}

s8 IsSubtitleHelpActive() {
    return Proc_Find(gProcScr_SubtitleHelp) != 0;
}

void ChangeSubtitleHelp(ProcPtr parent, const char * string)
{
    struct SubtitleHelpProc* proc;

    proc = Proc_Find(gProcScr_SubtitleHelp);
    if (proc == 0) {
        proc = Proc_Start(gProcScr_SubtitleHelp, parent);
    }

    proc->string = string;

    InitSubtitleHelpText(proc);

    proc->textOffset = 31;

    return;
}
