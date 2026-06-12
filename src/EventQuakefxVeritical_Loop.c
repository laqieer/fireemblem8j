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

void EventQuakefxVeritical_Loop(struct Proc * proc)
{
    struct ProcEventQuakeHandler * parent = proc->proc_parent;

    if (0x50 == parent->unk4C)
    {
        if (GetGameClock() % 2)
            BG_SetPosition(3, GetGameClock() & 1, 0);
    }
    else
    {
        if (GetGameClock() % 2)
        {
            (u16)gBmSt.camera.y &= 0xFFFD;
            gBmSt.camera.y ^= 1;
        }
    }
}
