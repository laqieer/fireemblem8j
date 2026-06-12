#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"
#include "worldmap.h"

//! FE8U = 0x080BB718
void GmapScreen2_Destruct(struct GmNodeIconDisplayProc * proc)
{
    AP_Delete(proc->ap);
    return;
}
