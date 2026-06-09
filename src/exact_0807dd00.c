#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmbattle.h"
#include "mu.h"
#include "event.h"
#include "hardware.h"
#include "ap.h"
#include "bmio.h"
#include "event.h"
#include "bmudisp.h"
#include "bm.h"
#include "spellassoc.h"
#include "constants/items.h"
#include "mapanim.h"

int GetFacingDirection(int xFrom, int yFrom, int xTo, int yTo)
{
    if (ABS(xTo - xFrom)*2 < ABS(yTo - yFrom))
    {
        if (yFrom < yTo)
            return MU_FACING_DOWN;
        else
            return MU_FACING_UP;
    }
    else
    {
        if (xFrom < xTo)
            return MU_FACING_RIGHT;
        else
            return MU_FACING_LEFT;
    }
}
