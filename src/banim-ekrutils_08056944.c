#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void EfxTmFillA(u32 val)
{
    u16 * dst = gTmA_Banim;
    CpuFill32(val, dst, sizeof(gTmA_Banim));
}
