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
ProcPtr StartClassNameIntro(ProcPtr parent, struct ClassReelEnt* entry);
ProcPtr StartClassAnimDisplay(ProcPtr parent, struct ClassReelEnt* entry);
struct ClassReelEnt* GetClassReelEntry(int classSet, int index);

void ClassReel_Init(struct OpInfoProc* proc) {

    gLCDControlBuffer.dispcnt.mode = 0;

    SetupBackgrounds(0);

    NewEfxAnimeDrvProc();

    ResetClassReelSpell();

    proc->unk_38 = 0;
    proc->unk_3c = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    proc->index = 0;
    proc->mode = 2;
    proc->unk_32 = 0;

    return;
}

void ClassReel_ButtonPress_GoToTitle(struct OpInfoProc* proc) {

    Proc_End(Proc_Find(ProcScr_BmFadeIN));
    Proc_End(Proc_Find(ProcScr_BmFadeOUT));

    EndAllProcChildren(proc);

    Sound_FadeOutBGM(1);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    SetNextGameActionId(GAME_ACTION_EVENT_RETURN);

    Proc_Goto(proc, 5);

    return;
}

void ClassReel_Loop(struct OpInfoProc* proc) {

    switch (proc->mode) {
        case 2:
            proc->classReelEnt = GetClassReelEntry(proc->classSet, proc->index);

            if (proc->classReelEnt == 0) {
                SetNextGameActionId(GAME_ACTION_CLASS_REEL);
                Proc_Goto(proc, 4);
            } else {
                proc->index++;
                proc->mode = 1;
                StartClassNameIntro(proc, proc->classReelEnt);
            }
            break;

        case 3:
            StartClassAnimDisplay(proc, proc->classReelEnt);
            proc->mode = 1;

            break;

        case 1:
            if (gKeyStatusPtr->heldKeys & (A_BUTTON | B_BUTTON | START_BUTTON)) {
                ClassReel_ButtonPress_GoToTitle(proc);
            }

            break;
    }

    return;
}
