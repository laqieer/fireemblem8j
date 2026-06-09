#include "global.h"

#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"

#include "worldmap.h"

//! FE8U = 0x080BB6FC
void SkipGmNodeIconDisplay(struct GmNodeIconDisplayProc * proc)
{
    proc->skip = 1;
    return;
}

//! FE8U = 0x080BB708
void UnskipGmNodeIconDisplay(struct GmNodeIconDisplayProc * proc)
{
    proc->skip = 0;
    return;
}
