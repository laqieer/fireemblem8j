#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "scene.h"
#include "bmio.h"
#include "face.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "event.h"
#include "sysutil.h"
#include "cgtext.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_YesNoChoice[];

// clang-format on

//! FE8U = 0x080900EC
void StartYesNoChoice(int * choiceTextIds, struct Text * th, int x, int y, int color, int defaultChoice, ProcPtr parent)
{
    struct YesNoChoiceProc * proc;

    Text_InsertDrawString(th, 16, color, GetStringFromIndex(choiceTextIds[0]));
    Text_InsertDrawString(th, 56, color, GetStringFromIndex(choiceTextIds[1]));

    proc = Proc_StartBlocking(gProcScr_YesNoChoice, parent);
    proc->currentChoice = defaultChoice;
    proc->x = x + 16;
    proc->y = y;

    return;
}
