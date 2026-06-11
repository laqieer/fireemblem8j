#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "worldmap.h"

//! FE8U = 0x080C13CC
void EndGmapEffectProc(ProcPtr proc)
{
    Proc_End(proc);
    return;
}
