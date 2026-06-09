#include "global.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "anime.h"
#include "ekrlevelup.h"
#include "bmitem.h"
#include "proc.h"
#include "banim_data.h"
#include "ekrdragon.h"
#include "eventinfo.h"
#include "constants/items.h"
#include "constants/songs.h"

/* Banim hp-bar change effect */

int CheckEkrHitDone(void)
{
    if (gEkrHpBarCount == 0 && gEfxSpellAnimExists == 0)
        return true;
    else
        return false;
}
