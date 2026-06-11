#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "hardware.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "mapanim.h"
#include "constants/songs.h"

void ProcMAExpBar_LevelUpIfPossible(struct MAExpBarProc* proc)
{
    if (proc->expTo >= 100)
        StartManimLevelUp(proc->actorId, (struct Proc*) proc);
}
