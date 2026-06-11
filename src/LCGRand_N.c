#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmmap.h"
#include "rng.h"
#include "constants/classes.h"
#include "constants/items.h"

int LCGRand_N(int a)
{
    return DivRem(AdvanceGetLCGRNValue(), a + 1);
}
