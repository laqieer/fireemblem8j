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
void StartSoloEndingBattleDisplay(struct CharacterEndingEnt * endingEnt, struct Unit * unit, struct CharacterEndingProc * parent);
void StartPairedEndingBattleDisplay(struct CharacterEndingEnt * endingEnt, struct Unit * unitA, struct Unit * unitB, struct CharacterEndingProc * parent);

//! FE8U = 0x080B6BD8
void CharacterEnding_StartBattleDisplay(struct CharacterEndingProc * proc)
{
    switch (proc->pCharacterEnding->type)
    {
        case CHARACTER_ENDING_SOLO:
            StartSoloEndingBattleDisplay(proc->pCharacterEnding, proc->unitA, proc);
            break;

        case CHARACTER_ENDING_PAIRED:
            StartPairedEndingBattleDisplay(proc->pCharacterEnding, proc->unitA, proc->unitB, proc);
            break;
    }

    return;
}
