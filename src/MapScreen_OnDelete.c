#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "worldmap.h"

//! FE8U = 0x080BA758
void MapScreen_OnDelete(struct GmScreenProc * proc)
{
    Proc_End(proc->unk_48);
    return;
}
