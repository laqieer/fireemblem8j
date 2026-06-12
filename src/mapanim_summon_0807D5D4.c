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

/* prototypes for same-file helpers called by this run */
void SelSumPosAndMoveCamera(struct SumProc* proc, s8 x, s8 y, short arg3);

void ProcSummonDK_SelectRightPos(struct SumProc* proc)
{
    SelSumPosAndMoveCamera(proc,
        gBattleActor.unit.xPos + 4, gBattleActor.unit.yPos,
        PROC_LABEL_SUMDK_LOAD_POS_LEFT);
}
