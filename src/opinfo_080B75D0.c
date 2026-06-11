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



// TODO: Move elsewhere
void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

// TODO: Forward declarations

void SetClassStatsDisplayNameX(ProcPtr, int);
struct ClassReelEnt* GetClassReelEntry(int, int);
ProcPtr StartClassNameIntro(ProcPtr, struct ClassReelEnt*);
ProcPtr StartClassAnimDisplay(ProcPtr, struct ClassReelEnt*);
signed char* GetClassReelName(u8, signed char*);
ProcPtr StartClassNameIntroLetter(ProcPtr, u8);
ProcPtr StartClassNameIntroIcon(ProcPtr, u8);

extern struct ProcCmd CONST_DATA gProcScr_opinfo[];

extern ProcPtr* gUnk_58;

void SetClassReelMode(int mode) {
    struct OpInfoProc* proc = Proc_Find(gProcScr_opinfo);

    if (proc != 0) {
        proc->mode = mode;
    }

    return;
}

void ClassReel_FadeOutBGM(void) {
    Sound_FadeOutBGM(3);

    return;
}

void ClassReel_OnEnd(ProcPtr proc) {

    EndAllProcChildren(proc);

    EndEfxAnimeDrvProc();
    GameControl_ClearPaletteAndReset(0);
    EndActiveClassReelBgColorProc();

    return;
}

void StartClassReel(u8 classSet, ProcPtr parent) {
    struct OpInfoProc* proc = Proc_StartBlocking(gProcScr_opinfo, parent);
    proc->classSet = classSet;

    return;
}
