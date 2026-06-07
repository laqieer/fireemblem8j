#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "anime.h"
#include "bmitem.h"
#include "constants/items.h"



int GetEkrHit(int pos)
{
    return gEkrGaugeHit[pos];
}

int GetEkrDmg(int pos)
{
    return gEkrGaugeDmg[pos];
}

int GetEkrCrit(int pos)
{
    return gEkrGaugeCrt[pos];
}
