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

/* prototypes for same-file helpers called by this run */
void ProcMAExpBar_FrameAdvance(struct MAExpBarProc* proc);

void ProcMAExpBar_InitDisplay(struct MAExpBarProc* proc)
{
    proc->timer = 0;

    ProcMAExpBar_FrameAdvance(proc);

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);
}
