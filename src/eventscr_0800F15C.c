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

/* prototypes for same-file helpers called by this run */
u8 Event23_DisaleMapDisp(struct EventEngineProc * proc);

//! FE8U = 0x0800EF48
void ConvoBackgroundFade_End(struct ConvoBackgroundFadeProc * proc)
{
    switch (proc->fadeType)
    {
        case 0:
            SetDispEnable(FALSE, FALSE, FALSE, TRUE, TRUE);

            break;

        case 1:
            SetDispEnable(FALSE, FALSE, FALSE, TRUE, FALSE);
            Event23_DisaleMapDisp(proc->pEventEngine);

            break;

        case 2:
            SetDispEnable(FALSE, FALSE, FALSE, TRUE, TRUE);

            InitSystemTextFont();
            LoadGameCoreGfxLegacyFrame();

            break;
    }

    // BG0 > BG1 > BG2 > BG3
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_SetPosition(BG_2, 0, 0);

    SetBlendNone();

    SetBlendTargetA(FALSE, FALSE, FALSE, FALSE, FALSE);
    SetBlendTargetB(FALSE, FALSE, FALSE, FALSE, FALSE);

    SetBlendBackdropA(TRUE);
    SetBlendBackdropB(TRUE);

    RestorePalette();

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    CpuFastFill(0, (void *)(VRAM + GetBackgroundTileDataOffset(0)), 0x20);
    CpuFastFill(0, (void *)(VRAM + GetBackgroundTileDataOffset(1)), 0x20);
    CpuFastFill(0, (void *)(VRAM + GetBackgroundTileDataOffset(2)), 0x20);
}
