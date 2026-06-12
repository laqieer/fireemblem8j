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

void ClassIntroFlare_Loop(struct OpInfoFlareProc* proc) {
    int unkA;
    int unkB;
    int unkC;
    int unkD;

    if (proc->unk_4c < 30) {
        unkA = Interpolate(5, 4, 0x32, proc->unk_4c, 0x1E);
        unkB = Interpolate(4, 0, 0x10, proc->unk_4c, 0x1E);
    } else {
        unkA = Interpolate(0, 0x32, 100, proc->unk_4c - 0x1E, 0x1E);
        unkB = Interpolate(0, 0x10, 0, proc->unk_4c - 0x1E, 0x1E);
    }

    if (49 < unkA) {
        unkA = 100 - unkA;
    }

    unkC = Interpolate(0, 0, 0xD6, proc->unk_4c, 0x3C);
    unkD = Interpolate(0, 0x10, 0x80, proc->unk_4c, 0x3C);

    BgAffinRotScaling(2, (s16)proc->unk_4e, 0, 0, (s16)(unkA * 5 + 0x80), (s16)(unkA * 5 + 0x80));

    BgAffinScaling(2, 0x100, 0x100);

    BgAffinAnchoring(2, unkC, unkD, 0x50, 0x48);

    proc->unk_4e -= 0x40;

    SetBlendConfig(1, unkB, 0x10, 0);

    proc->unk_4c++;

    if (59 < proc->unk_4c) {
        Proc_Break(proc);

        gLCDControlBuffer.dispcnt.bg0_on = 1;
        gLCDControlBuffer.dispcnt.bg1_on = 1;
        gLCDControlBuffer.dispcnt.bg2_on = 0;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 1;
    }

    return;
}
