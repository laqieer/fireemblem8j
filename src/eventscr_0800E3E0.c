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
void EndEventFaces(struct EventEngineProc * proc);
u8 Event23_DisaleMapDisp(struct EventEngineProc * proc);

//! FE8U = 0x0800E188
u8 Event1A_TEXTSTART(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    if (subcode != proc->activeTextType && subcode != EVSUBCMD_0x1A25)
    {
        EndTalk();
        EndCgText();
        EndAllBoxDialogue();

        if (proc->execType == EV_EXEC_CUTSCENE)
            ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

        EndEventFaces(proc);
    }

    proc->activeTextType = subcode;

    switch (subcode) {
    case EVSUBCMD_TEXTSTART:
    case EVSUBCMD_TUTORIALTEXTBOXSTART:
    case EVSUBCMD_SOLOTEXTBOXSTART:
    case EVSUBCMD_0x1A25:
        return EVC_ADVANCE_YIELD;

    case EVSUBCMD_REMOVEPORTRAITS:
    case EVSUBCMD_0x1A22:
        return Event23_DisaleMapDisp(proc);

    default:
        return EVC_ERROR;

    } // switch (subcode)
}
