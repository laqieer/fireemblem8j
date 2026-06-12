#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "bmidoten.h"
#include "mu.h"
#include "chapterdata.h"
#include "face.h"
#include "scene.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "gamecontrol.h"
#include "uimenu.h"
#include "prepscreen.h"
#include "playerphase.h"
#include "bmbattle.h"
#include "popup.h"
#include "muctrl.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "cgtext.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "constants/backgrounds.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "bmfx.h"
#include "colorfade.h"
#include "constants/songs.h"

void BgChangeChr(int, int);

/* file-scope type definitions used by this run */


struct MapCursorProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);

    /* 64 */ s16 x;
    /* 66 */ s16 y;
    /* 68 */ u16 subcmd;
    /* 6A */ u16 timer;
};

struct ProcEventPromote
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x58);

    /* 58 */ struct EventEngineProc * event_engine;

    /* 5C */ STRUCT_PAD(0x5c, 0x64);

    /* 64 */ s16 lock;
};

//! FE8U = 0x0800EA84
void ConvoBackgroundFade_Init(struct ConvoBackgroundFadeProc * proc)
{
    SetDispEnable(FALSE, FALSE, FALSE, TRUE, TRUE);

    BG_SetPosition(BG_2, 0, 0);

    switch (proc->fadeType)
    {
        case 0:
            SetBlendAlpha(0, 0x10);

            // First: BG3; Second: BG2
            SetBlendTargetA(FALSE, FALSE, FALSE, TRUE, FALSE);
            SetBlendTargetB(FALSE, FALSE, TRUE, FALSE, FALSE);

            // BG0 > BG1 > BG3 > BG2
            gLCDControlBuffer.bg0cnt.priority = 0;
            gLCDControlBuffer.bg1cnt.priority = 1;
            gLCDControlBuffer.bg2cnt.priority = 3;
            gLCDControlBuffer.bg3cnt.priority = 2;

            break;

        case 1:
            SetBlendAlpha(0, 0x10);

            // First: BG2; Second: BG3|OBJ
            SetBlendTargetA(FALSE, FALSE, TRUE, FALSE, FALSE);
            SetBlendTargetB(FALSE, FALSE, FALSE, TRUE, TRUE);

            // BG2 > BG0 > BG1 > BG3
            gLCDControlBuffer.bg0cnt.priority = 1;
            gLCDControlBuffer.bg1cnt.priority = 2;
            gLCDControlBuffer.bg2cnt.priority = 0;
            gLCDControlBuffer.bg3cnt.priority = 3;

            break;

        case 2:
            SetBlendAlpha(0x10, 0);

            // First: BG2; Second: BG3|OBJ
            SetBlendTargetA(FALSE, FALSE, TRUE, FALSE, FALSE);
            SetBlendTargetB(FALSE, FALSE, FALSE, TRUE, TRUE);

            // BG2 > BG0 > BG1 > BG3
            gLCDControlBuffer.bg0cnt.priority = 1;
            gLCDControlBuffer.bg1cnt.priority = 2;
            gLCDControlBuffer.bg2cnt.priority = 0;
            gLCDControlBuffer.bg3cnt.priority = 3;

            break;
    }

    SetBlendBackdropA(TRUE);
    SetBlendBackdropB(FALSE);

    BackupPalette(0, 6);
}
