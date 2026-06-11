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
void PutClassNameIntroLetter(u8 charId, int x, int y, u16 xScale, u16 yScale, u8 offset);

void ClassIntroLetter_LoopFadeIn(struct OpInfoViewProc* proc) {
    int timer = proc->timer, a;
#ifndef NONMATCHING
    register int timer2 asm("r1") = timer;
#else
    int timer2 = timer;
#endif

    if (timer2) { ++timer2; --timer2; }
    timer2 >>= 4;
    a = (0x10 - timer2) * 2;

    PutClassNameIntroLetter(
        proc->charIndex,
        proc->unk_2e - a,
        0x18,
        timer,
        0x100,
        0x10 - ({proc->timer + 0;}) / 16
    );

    if ((proc->timer += 0x10) == 0x100) {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

void ClassIntroLetter_LoopDisplay(struct OpInfoViewProc* proc) {

    PutClassNameIntroLetter(proc->charIndex, proc->unk_2e, 0x18, 0x100, 0x100, 0);

    proc->timer = 0;

    return;
}
