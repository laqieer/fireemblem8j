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

extern EWRAM_OVERLAY(gamestart) struct AnimBuffer gOpInfoData;

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

void ClassInfoDisplay_LoopScript(struct OpInfoClassDisplayProc* proc) {

    switch (proc->script->opCode) {
        case CLASS_REEL_OP_1:
        case CLASS_REEL_OP_2:
        case CLASS_REEL_OP_3:
        case CLASS_REEL_OP_4:
        case CLASS_REEL_OP_6:
        case CLASS_REEL_OP_7:
            proc->script++;
            Proc_Break(proc);

            break;

        case CLASS_REEL_OP_5:
            proc->unk_2a++;

            if (proc->unk_2a < proc->script->extra) {
                return;
            }

            proc->script++;
            Proc_Break(proc);

            break;

        case CLASS_REEL_OP_8:
            if (IsMainMiniAnimRoundEnd(&gOpInfoData) != 0) {
                proc->script++;
                Proc_Break(proc);
            }
    }

    return;
}
