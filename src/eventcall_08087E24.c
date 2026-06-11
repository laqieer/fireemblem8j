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



/* https://decomp.me/scratch/sgFDG */
void WorldFlushIn(struct ProcWorldFlush * proc)
{
    int val0, val1, val3, val4, val5, count, max_count;
#ifndef NONMATCHING
    register int val2 asm("r5");
#else
    int val2;
#endif
    val1 = 0x80;
    val2 = 0xF0;

    proc->count += 1;

    val1 = val1 - proc->count;
    val5 = val1 * val2;
    val5 = val5 * val1;
    val4 = 0x4000;
    val2 = val5 / val4;

    val3 = (int)((proc->count *  0x10) * proc->count) / val4;
    val0 = 0x10 - val3;

    UpdateMapAnimDitheredCircleScanline(0x78, 0x30, val2);
    SetBlendConfig(2, 0, 0, val0);

    count = proc->count;
    max_count = 0x80;
    if (count >= max_count)
        Proc_Break(proc);
}

void WorldFlushCallBack(void)
{
    SetPrimaryHBlankHandler(0);
    SetBlendConfig(0, 0, 0, 0);
    
    SetWinEnable(0, 0, 0);
    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;
}

void StartWorldFlush(struct EventEngineProc * proc)
{
    Proc_StartBlocking(ProcScr_WorldFlush, proc);
}
