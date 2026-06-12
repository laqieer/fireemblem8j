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

void ProcSummonDK_ResetCounter(struct SumProc* proc)
{
    proc->counter++;
    proc->monsters = 0;

    New6C_SummonGfx(proc, proc->x, proc->y);
}
