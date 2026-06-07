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

//! FE8U = 0x0800E51C
u8 Event1D_TalkContinue(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        EndTalk();
        EndCgText();
        EndAllBoxDialogue();

        if (proc->execType == EV_EXEC_CUTSCENE)
            ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

        EndEventFaces(proc);
    }
    else
    {
        ResumeTalk();
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800E560
u8 Event1D_WaitForLockTalk(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        EndTalk();
        EndCgText();
        EndAllBoxDialogue();

        if (proc->execType == EV_EXEC_CUTSCENE)
            ChangeUnitSpritePalette(proc->mapSpritePalIdOverride);

        EndEventFaces(proc);

        gEventSlots[0xC] = 0;
    }
    else
    {
        u32 flag = FALSE;

        if ((IsTalkActive() && !IsTalkLocked()) || CgTextExists() || Proc_Find(gProcScr_BoxDialogue))
            flag = TRUE;

        if (flag == TRUE)
        {
            switch (proc->execType)
            {

                case EV_EXEC_WORLDMAP:
                case EV_EXEC_UNK4:
                    return EVC_STOP_YIELD;

                default:
                    switch (proc->activeTextType)
                    {

                        case 0:
                        case 1:
                        case 2:
                            SetBlendAlpha(0x10, 1);
                            break;

                        case 3:
                        case 4:
                        case 5:
                            break;

                    } // switch (proc->activeTextType)

                    return EVC_STOP_YIELD;

            } // switch (proc->execType)
        }
        else
        {
            gEventSlots[0xC] = GetTalkChoiceResult();
        }
    }

    if (proc->overwrittenTextSpeed != -1)
        gPlaySt.config.textSpeed = proc->overwrittenTextSpeed;

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800E640
void EndEventFaces(struct EventEngineProc * proc)
{
    if (proc->evStateBits & EV_STATE_FADEDIN)
    {
        ClearTalkBubble();
        Proc_EndEach(gProcScr_E_FACE); // end all faces
        ResetFaces();
        ClearTalkFaceRefs();
    }
    else if (FaceExists())
    {
        ClearTalkBubble();
        Proc_ForEach(gProcScr_E_FACE, (ProcFunc)StartFaceFadeOut);
        Proc_StartBlocking(gEventscr_0, proc);
    }
}
