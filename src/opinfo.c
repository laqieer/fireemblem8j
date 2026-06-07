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

/* prototypes for same-file helpers called by this run */
void PutClassWeaponRankIcons(u8 a, u8 b, u8 c);

void ClassIntroIcon_LoopFadeIn(struct OpInfoIconProc* proc) {
    u8 unk;

    proc->timer++;

    if (proc->timer >= 33) {
        unk = 0;
        Proc_Break(proc);
    } else {
        unk = 0x10 - (proc->timer >> 1);
    }

    PutClassWeaponRankIcons(unk, proc->numIcons, proc->unk_2e);

    return;
}

void ClassIntroIcon_LoopDisplay(struct OpInfoIconProc* proc) {

    PutClassWeaponRankIcons(0, proc->numIcons, proc->unk_2e);

    proc->timer = 0;

    return;
}

void ClassIntroIcon_LoopFadeOut(struct OpInfoIconProc* proc) {
    proc->timer++;

    if ((proc->timer >> 1) >= 17) {
        gLCDControlBuffer.dispcnt.bg0_on = 0;
        gLCDControlBuffer.dispcnt.bg1_on = 1;
        gLCDControlBuffer.dispcnt.bg2_on = 0;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 1;

        Proc_Break(proc);
    } else {
        PutClassWeaponRankIcons((proc->timer >> 1), proc->numIcons, proc->unk_2e);
    }

    return;
}
