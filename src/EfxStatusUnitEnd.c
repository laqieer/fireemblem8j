#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "anime.h"
#include "hardware.h"
#include "bmmap.h"
#include "mu.h"
#include "bmudisp.h"
#include "constants/video-banim.h"




void EfxStatusUnitEnd(struct ProcEfxStatusUnit *proc)
{
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], &PAL_COLOR(0x17, 0), 0x20);
    else
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], &PAL_COLOR(0x19, 0), 0x20);

    EnablePaletteSync();
}
