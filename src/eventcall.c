/**
 * Most "ASMCs" are here (functions called through chapter events)
 * Exceptions include the Suspend effect function and probably other
 * system (non-chapter) functions called through events
 */

#include "global.h"
#include "variables.h"
#include "functions.h"
#include "constants/video-global.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "bmlib.h"
#include "proc.h"
#include "event.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmio.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmmap.h"
#include "mu.h"
#include "bmreliance.h"
#include "bmtrick.h"
#include "bmdifficulty.h"
#include "ctc.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmind.h"
#include "uiutils.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "bmudisp.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "prepscreen.h"
#include "eventinfo.h"
#include "mapanim.h"
#include "muctrl.h"
#include "scene.h"
#include "sysutil.h"

#include "eventcall.h"
#include "constants/songs.h"



void StartEventVeriticalQuakefx(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventVerticalQuakefx);
    if (!proc)
        proc = Proc_Start(ProcScr_EventVerticalQuakefx, parent);

    Proc_Goto(proc, 0);
    PlaySoundEffect(SONG_26A);
}

void StartEventHorizontalQuakefxViolently(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventHorizontalQuakefx);
    if (!proc) {
        PlaySoundEffect(SONG_26A);
        proc = Proc_Start(ProcScr_EventHorizontalQuakefx, parent);
    }
    Proc_Goto(proc, 0);
}

void StartEventHorizontalQuakefxSlightly(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventHorizontalQuakefx);
    if (!proc) {
        PlaySoundEffect(SONG_26A);
        proc = Proc_Start(ProcScr_EventHorizontalQuakefx, parent);
    }
    Proc_Goto(proc, 1);
}

void StartEventHorizontalQuakefxViolentlyNoSound(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventHorizontalQuakefx);
    if (!proc)
        proc = Proc_Start(ProcScr_EventHorizontalQuakefx, parent);
    Proc_Goto(proc, 0);
}

void StartEventHorizontalQuakefxSlightlyNoSound(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventHorizontalQuakefx);
    if (!proc)
        proc = Proc_Start(ProcScr_EventHorizontalQuakefx, parent);
    Proc_Goto(proc, 1);
}

void EndEventHorizontalQuakefx(ProcPtr parent)
{
    (u16)gBmSt.camera.x &= 0xFFFC;
    Proc_EndEach(ProcScr_EventHorizontalQuakefx);
    Sound_FadeOutSE(4);
}

void EndEventVerticalQuakefx(void)
{
    (u16)gBmSt.camera.y &= 0xFFFC;
    Proc_EndEach(ProcScr_EventVerticalQuakefx);
    Sound_FadeOutSE(4);
}

void EventQuakefx_Init(struct Proc * proc)
{
    proc->unk4C = 0;
}

void EventQuakefx_Loop(struct Proc * proc)
{
    struct ProcEventQuakeHandler * parent = proc->proc_parent;

    if (-1 == parent->unk4C)
    {
        if (GetGameClock() % 2)
        {
            (u16)gBmSt.camera.x &= 0xFFFD;
            gBmSt.camera.x ^= 1;
        }
    }
    else
    {
        if (GetGameClock() % 2)
            BG_SetPosition(3, GetBgXOffset(3) ^ 1, 0);
    }

    if (0x10 == ++proc->unk4C)
    {
        Proc_Break(proc);
        Sound_FadeOutSE(4);
    }
}

void StartEventQuakefx(ProcPtr proc)
{
    Proc_Start(ProcScr_EventQuakefx, proc);
    PlaySoundEffect(SONG_26A);
}

void EndEventQuakefx(ProcPtr proc)
{
    (u16)gBmSt.camera.y &= 0xFFFC;
    Sound_FadeOutSE(4);
    Proc_EndEach(ProcScr_EventQuakefx);
}

void SetEventId_0x84(ProcPtr proc)
{
    SetFlag(0x84);
}

void UnsetEventId_0x84(ProcPtr proc)
{
    ClearFlag(0x84);
}

void UnitTornOut_Init(struct ProcUnitTornOut * proc)
{
    proc->timer = 0;
}
