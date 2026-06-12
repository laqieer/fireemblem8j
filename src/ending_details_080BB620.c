#include "global.h"

#include "chapterdata.h"
#include "bmsave.h"
#include "hardware.h"
#include "face.h"
#include "bmreliance.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "ctc.h"
#include "bmlib.h"
#include "bmtrade.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sysutil.h"
#include "scene.h"

#include "ending_details.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"


extern EWRAM_OVERLAY(gameending) u16 gEndingTmScratchA[0x800 / 2];













extern u16 * CONST_DATA gSoloEndingBattleDispConf[];



/* prototypes for same-file helpers called by this run */
struct Unit * GetUnitForCharacterEnding(int pid);
int GetUnitASupporterPid(struct Unit * unit);
bool DoesUnitHavePairedEnding(struct CharacterEndingEnt * pairingEnt, struct Unit * unit);

//! FE8U = 0x080B6AE0
void LoadNextCharacterEnding(struct CharacterEndingProc * proc)
{
    proc->unitB = NULL;
    proc->unitA = NULL;

    for (;; proc->pCharacterEnding++)
    {
        if (proc->pCharacterEnding->type == CHARACTER_ENDING_NONE)
        {
            Proc_Goto(proc, 100);
            return;
        }

        if ((*&proc->pidShownFlags[proc->pCharacterEnding->pidA >> 5] >> (proc->pCharacterEnding->pidA & 0x1f)) & 1)
        {
            continue;
        }

        if (proc->pCharacterEnding->pidB != 0)
        {
            if ((*&proc->pidShownFlags[proc->pCharacterEnding->pidB >> 5] >> (proc->pCharacterEnding->pidB & 0x1f)) & 1)
            {
                continue;
            }
        }

        proc->unitA = GetUnitForCharacterEnding(proc->pCharacterEnding->pidA);

        if (proc->unitA == NULL)
        {
            continue;
        }

        switch (proc->pCharacterEnding->type)
        {
            case CHARACTER_ENDING_SOLO:
                if (DoesUnitHavePairedEnding(proc->pCharacterEndingBkp, proc->unitA))
                {
                    continue;
                }

                break;

            case CHARACTER_ENDING_PAIRED:
                proc->unitB = GetUnitForCharacterEnding(proc->pCharacterEnding->pidB);

                if (proc->unitB == NULL)
                {
                    continue;
                }

                if (GetUnitASupporterPid(proc->unitA) != proc->pCharacterEnding->pidB)
                {
                    continue;
                }

                if (proc->unitA->state & US_DEAD)
                {
                    continue;
                }

                if (proc->unitB->state & US_DEAD)
                {
                    continue;
                }

                break;
        }

        *&proc->pidShownFlags[(proc->pCharacterEnding->pidA >> 5)] |= 1 << (proc->pCharacterEnding->pidA & 0x1f);

        if (proc->pCharacterEnding->pidB == 0)
        {
            return;
        }

        *&proc->pidShownFlags[proc->pCharacterEnding->pidB >> 5] |= 1 << (proc->pCharacterEnding->pidB & 0x1f);

        return;
    }
}
