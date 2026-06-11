#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "ctc.h"
#include "bmreliance.h"
#include "event.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "playerphase.h"
#include "cp_common.h"
#include "bmmind.h"
#include "bmtrick.h"
#include "bmio.h"
#include "fontgrp.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "bmphase.h"
#include "bmusailment.h"
#include "bmsave.h"
#include "worldmap.h"
#include "eventcall.h"

#include "bm.h"

#include "constants/event-flags.h"
#include "constants/songs.h"


extern struct BmSt EWRAM_DATA gBmSt;
extern struct PlaySt EWRAM_DATA gPlaySt;
extern struct Vec2 EWRAM_DATA sLastCoordMapCursorDrawn;
extern u32 EWRAM_DATA sLastTimeMapCursorDrawn;



extern s8 CONST_DATA sDirKeysToOffsetLut[][2];

extern u16 CONST_DATA sSprite_MapCursorA[];

extern u16 CONST_DATA sSprite_MapCursorB[];

extern u16 CONST_DATA sSprite_MapCursorC[];

extern u16 CONST_DATA sSprite_MapCursorStretched[];

extern u16* CONST_DATA sMapCursorSpriteLut[];

















extern struct ProcCmd CONST_DATA ProcScr_CamMove[];







//! FE8U = 0x080154F4
void BmMain_SuspendBeforePhase(void)
{
    gActionData.suspendPointType = SUSPEND_POINT_PHASECHANGE;
    WriteSuspendSave(SAVE_ID_SUSPEND);
}

//! FE8U = 0x0801550C
void BmMain_StartIntroFx(ProcPtr proc)
{
    if (gPlaySt.chapterIndex == 0x38)
        return;

    if (gPlaySt.chapterIndex == 0x06 && CheckFlag(0x88))
        return;

    Proc_StartBlocking(gProcScr_ChapterIntro, proc);
}

//! FE8U = 0x08015544
void UndeployEveryone(void)
{
    int i;

    ClearFlag(0x84);

    if ((gPlaySt.unk4A_1) == 0)
    {
        for (i = 1; i < FACTION_GREEN; i++)
        {
            struct Unit * unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            unit->state &= ~(US_NOT_DEPLOYED);
        }
    }
}
