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

void DrawMAExpBar(int arg0, int arg1, int arg2);

void ProcMAExpBar_OnIncrement(struct MAExpBarProc* proc)
{
    proc->expFrom++;

    if (proc->expFrom >= 100)
        proc->expFrom = 0;

    DrawMAExpBar(6, 8, proc->expFrom);

    if (proc->expFrom == proc->expTo % 100) {
        Proc_Break(proc);
        m4aSongNumStop(SONG_74);
    }
}
