#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "bm.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "bmmap.h"
#include "proc.h"
#include "soundwrapper.h"
#include "rng.h"
#include "bmmind.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "mapanim.h"
#include "constants/songs.h"

void LoadSumMonsterFromDK(struct SumProc* proc)
{
    u8 num = DivRem(AdvanceGetLCGRNValue(), 11);

    gUnitDef2 = gUnitDefSumDK[num];

    gUnitDef2.autolevel = TRUE;
    gUnitDef2.allegiance = 2;
    gUnitDef2.level = 5 + num;

    gUnitDef2.xPosition = proc->x;
    gUnitDef2.yPosition = proc->y;

    LoadUnits(&gUnitDef2);
}
