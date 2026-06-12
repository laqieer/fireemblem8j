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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_EndingBattleDisplay_Solo[];

// clang-format on

//! FE8U = 0x080B6F14
void StartSoloEndingBattleDisplay(struct CharacterEndingEnt * endingEnt, struct Unit * unit, struct CharacterEndingProc * parent)
{
    struct EndingBattleDisplayProc * proc = Proc_StartBlocking(gProcScr_EndingBattleDisplay_Solo, parent);

    proc->units[0] = unit;
    proc->units[1] = NULL;

    proc->pCharacterEnding = endingEnt;

    return;
}
