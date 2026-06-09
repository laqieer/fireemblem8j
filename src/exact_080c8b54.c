#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"

#include "worldmap.h"

//! FE8U = 0x080C3D9C
void GMapRadar_Init(struct GMapRadarProc * proc)
{
    proc->unk_34 = 0;
    proc->unk_29 = 0;
    proc->unk_2a = 0;
    return;
}
