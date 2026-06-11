#include "global.h"

#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"

#include "prepscreen.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

int CheckInLinkArena(void);

extern EWRAM_OVERLAY(0) struct Text gPrepItemTexts[32];







/* prototypes for same-file helpers called by this run */
void EndDrawPrepFundsSprite(void);
void EndDrawPrepUnitInfoBgSprites(void);
void EndPrepItemScreenFace(int slot);

//! FE8U = 0x080989BC
void PrepItemScreen_OnEnd(struct PrepItemScreenProc * proc)
{
    struct Unit * unit = GetUnitFromPrepList(proc->hoverUnitIdx);
    PrepSetLatestCharId(unit->pCharacterData->number);

    EndAllParallelWorkers();
    EndSysHandCursor();

    EndUiCursorHand();

    EndPrepItemScreenFace(0);
    EndPrepItemScreenFace(1);

    EndMuralBackground_();
    EndHelpPromptSprite();

    EndMenuScrollBar();

    EndDrawPrepFundsSprite();
    EndDrawPrepUnitInfoBgSprites();

    SetPrimaryHBlankHandler(NULL);

    return;
}
