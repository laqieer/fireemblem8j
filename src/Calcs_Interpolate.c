#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "rng.h"
#include "ctc.h"
#include "bmfx.h"
#include "bmlib.h"

void Calcs_Interpolate(int *buf1, int *buf2, int r2, int r3, int r4)
{
    *buf1 = Interpolate(0, *buf1, r2, r4, 0x100);
    *buf2 = Interpolate(0, *buf2, r3, r4, 0x100);
}
