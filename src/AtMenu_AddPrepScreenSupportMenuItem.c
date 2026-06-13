#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmitem.h"
#include "hardware.h"
#include "chapterdata.h"
#include "bmudisp.h"
#include "worldmap.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sio.h"
#include "prepscreen.h"
#include "constants/chapters.h"
#include "constants/items.h"
#include "constants/songs.h"

void AtMenu_AddPrepScreenSupportMenuItem(struct ProcAtMenu *proc)
{
    int i;
    int color = 0;

    proc->unk_2F = 0;
    if (0 != (PLAY_FLAG_EXTRA_MAP & gPlaySt.chapterStateBits))
        return;

    for (i = 0; i < 4; i++) {
        if (0 == (s8)IsDivinationOptionAvailable(i))
            continue;

        proc->unk_2F |= 1 << i;
    }

    if (0 == (s8)IsDivinationOptionAvailable(2))
        color = 1;

    SetPrepScreenMenuItem(4, PrepScreenMenu_OnSupport, color, 0x513, 0);
}
