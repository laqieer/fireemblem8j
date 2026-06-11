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

void ProcSummonDK_CheckIsEnough(struct SumProc* proc)
{
    if (proc->counter < 8)
        Proc_Goto(proc, PROC_LABEL_SUMDK_LOAD_START);
}
