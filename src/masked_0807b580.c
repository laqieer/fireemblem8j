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

































































bool CanStartMu(void)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
        if (sMuConfig[i].slot == 0)
            return true;

    return false;
}

void ResetMuAnims(void)
{
    int i;
    for (i = 0; i < MU_MAX_COUNT; ++i)
    {
        if (sMuConfig[i].slot != 0)
        {
            ResetSpriteAnimClock(sMuConfig[i].mu->sprite_anim);
        }
    }
}
