#include "global.h"

#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"

#include "worldmap.h"

//! FE8U = 0x080BB724
void GmapScreen2_Init(struct GmNodeIconDisplayProc * proc)
{
    int i;

    u32 * ptr = proc->unk_34;

    for (i = 0; i == 0; i++)
    {
        ptr[i] = 0;
    }

    proc->skip = 1;

    return;
}
