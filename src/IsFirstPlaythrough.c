#include "global.h"
#include <string.h>
#include "constants/classes.h"
#include "proc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "chapterdata.h"
#include "rng.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtrick.h"
#include "mu.h"
#include "uimenu.h"
#include "bmtrap.h"
#include "gamecontrol.h"
#include "bmarena.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "worldmap.h"
#include "bmio.h"
#include "bmmind.h"

int IsFirstPlaythrough(void) {
    u8 tmp = IsGamePlayedThrough();
    if (!tmp)
        return TRUE;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        return FALSE;

    return gPlaySt.config.unk41_5;
}
