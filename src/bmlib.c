#include "global.h"
#include "variables.h"
#include "functions.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"
#include "spline.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "constants/songs.h"

struct Struct8012F98 {
    u8* dst;
    int unk_04;
};

void FadeCore_Loop(struct FadeCoreProc * proc)
{
    if (!FadeCore_Tick(proc)) {
        if (proc->on_end)
            proc->on_end();

        Proc_Break(proc);
    }
}

bool FadeCore_Tick(struct FadeCoreProc * proc)
{
    proc->looper += proc->speed;
    proc->counter += proc->speed;

    if (proc->looper < 0x10)
    { 
        if (proc->counter != proc->speed)
            return TRUE;
    }
    else
    {
        proc->looper = proc->looper - 0x10;
    }

    CALLARM_ColorFadeTick();
    SetBackdropColor(0);

    if (proc->counter >= 0x200)
        return FALSE;

    return TRUE;
}

void FadeCore_StopObjPalFade(void)
{
    ColorFadeSetStepRange(0x10, 0x10, 0);
    ClearFadeCoreCallback();
}

void StopFadeComponents(int a, int b)
{
    ColorFadeSetStepRange(a, b, 0);
    ClearFadeCoreCallback();
}

void ClearFadeCoreCallback(void)
{
    struct FadeCoreProc * proc = Proc_Find(ProcScr_FadeCore);

    if (proc)
        proc->on_end = NULL;
}

void ForceScreenToBlack(void)
{
    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);
    SetBackdropColor(0);
    SetDispEnable(0, 0, 0, 0, 0);
}
