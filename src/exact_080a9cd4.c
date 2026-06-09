#include "global.h"

#include "bmitem.h"
#include "agb_sram.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmdifficulty.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmind.h"
#include "event.h"
#include "bmtrick.h"
#include "functions.h"
#include "bmreliance.h"
#include "bmunit.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "eventinfo.h"




/* prototypes for same-file helpers called by this run */
bool IsSaveValid(int index);
void ReadGameSavePlaySt(int slot, struct PlaySt *buf);

bool IsGameNotFirstChapter(struct PlaySt *chapter_data)
{
    if (PLAY_FLAG_COMPLETE & chapter_data->chapterStateBits)
        return true;
    else if (0 != chapter_data->chapterIndex)
        return true;
    else
        return false;
}

bool IsGameSaveNotFirstChapter(int slot)
{
    struct PlaySt chapter_data;

    if (!IsSaveValid(slot))
        return false;

    ReadGameSavePlaySt(slot, &chapter_data);
    return IsGameNotFirstChapter(&chapter_data);
}
