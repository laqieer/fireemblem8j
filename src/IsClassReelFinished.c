#include "global.h"
#include <stdio.h>
#include <string.h>
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "scene.h"
#include "classdisplayfont.h"
#include "opinfo.h"
#include "anime.h"
#include "efxbattle.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "sysutil.h"
#include "constants/classes.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_opinfo[];

struct ClassReelEnt* GetClassReelEntry(int classSet, int index);

s8 IsClassReelFinished(void) {
    struct OpInfoProc* proc = Proc_Find(gProcScr_opinfo);

    if (proc && !GetClassReelEntry(proc->classSet, proc->index)) {
        return 1;
    }

    return 0;
}
