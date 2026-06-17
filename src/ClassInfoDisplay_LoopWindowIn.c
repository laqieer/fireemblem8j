#include "global.h"
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



void ClassInfoDisplay_AutoAdvanceWorker(struct OpInfoClassDisplayProc* proc);
void SetBanimTerrainPos(struct BanimUnkStructComm * buf, s16 a, s16 b, s16 c, s16 d);
void SetClassStatsDisplayNameX(ProcPtr proc, int unk);

void ClassInfoDisplay_LoopWindowIn(struct OpInfoClassDisplayProc* proc) {

    int unk;

    u8* ptr = &proc->unk_46;

    unk = ~((80 - proc->unk_2a) / 14);

    proc->unk_46 = unk + *ptr;

    if (proc->unk_46 < 180) {
        proc->unk_46 = 180;
    }

    SetDispEnable(1, 1, 1, 1, 1);

    SetWinEnable(1, 0, 0);

    SetWin0Box(0, 80 - proc->unk_2a, 240, proc->unk_2a + 80);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);

    if (proc->unk_2a == 80) {
        proc->unk_46 = 180;
        proc->unk_2a = 0;

        Proc_Break(proc);

        StartParallelWorker(ClassInfoDisplay_AutoAdvanceWorker, proc);
    } else {
        proc->unk_2a += 4;
    }

    SetMainMiniAnimPos(&gOpInfoData, proc->unk_46, 88);
    SetBanimTerrainPos(&gUnk_Opinfo_0, proc->unk_46 - 48, 104, proc->unk_46 + 48, 104);

    SetClassStatsDisplayNameX(proc->unk_3c, 100);

    return;
}
