#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "bm.h"
#include "worldmap.h"


void GmapAutoMu_WaitForFadeEnd(ProcPtr proc)
{
    if (!GmUnitFadeExists())
    {
        Proc_Break(proc);
    }

    return;
}
