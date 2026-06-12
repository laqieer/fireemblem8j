#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "mu.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "uimenu.h"
#include "scene.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "worldmap.h"
#include "cgtext.h"
#include "helpbox.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"

void EventEngine_OnEnd(struct EventEngineProc* proc) {
    SetTextFont(NULL);
    InitSystemTextFont();
    LoadUiFrameGraphics();

    switch (proc->execType) {
    case EV_EXEC_UNK4:
        break;

    case EV_EXEC_UNK5:
        ReadGameSaveCoreGfx();
        UnpackChapterMapPalette();
        ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

        if (proc->evStateBits & EV_STATE_CHANGEGM) {
            EndAllMus();
            EndBMapMain();
            memset((u8*)(gEventCallQueue), 0, 0x80);
        }

    case EV_EXEC_GAMEPLAY:
        UnlockGame();
        ResumeMenu();
        ResetBkselPalette();
        ClearCutsceneUnits();

        break;
    }

    if (proc->execType != EV_EXEC_QUIET) {
        EndTalk();
        EndCgText(); // End some thing
        EndAllBoxDialogue(); // End some more things

        if (proc->execType == EV_EXEC_CUTSCENE)
            ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

        EndEventFaces(proc);
    }

    if (!(proc->evStateBits & EV_STATE_ABORT))
        CallNextQueuedEvent();
}
