#include "global.h"

#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"



static struct MuConfig sMuConfig[MU_MAX_COUNT];

































































bool MuExistsActive(void)
{
    int i;

    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
#ifndef NONMATCHING
        asm(""::"r"(&sMuConfig[i].slot));
        asm(""::"r"(&sMuConfig[i].mu));
#endif
        if (sMuConfig[i].slot == 0) continue;
        while (0) ;
        if (sMuConfig[i].mu->state != MU_STATE_INACTIVE)
            return true;
    }

    if (i >= MU_MAX_COUNT)
        return false;

    return true;
}
