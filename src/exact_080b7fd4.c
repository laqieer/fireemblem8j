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

void ClassIntroBurst_Init(struct OpInfoBurstProc* proc) {
    proc->unk_4c = 0;
    proc->unk_64 = 0;
    proc->unk_66 = 0;
    proc->unk_68 = 0;

    return;
}
