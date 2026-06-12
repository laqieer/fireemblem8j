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

void WorldFlushOut(struct ProcWorldFlush * proc)
{
    int val0, val1, val2, val3, count, max_count;
    
    val2 = 0x40;
    val1 = 0xF0;

    proc->count += 1;

    val1 = val1 * proc->count * proc->count;
    val0 = 0x1000;
    val1 = val1 / val0;

    val2 = val2 - proc->count;
    val2 = (0x10 * val2 * val2) / val0;
    val3 = 0x10 - val2;

    UpdateMapAnimDitheredCircleScanline(0x78, 0x68, val1);
    SetBlendConfig(2, 0, 0, val3);

    count = proc->count;
    max_count = 0x40;
    if (count >= max_count)
        Proc_Break(proc);
}
