#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"

//! FE8U = 0x080623D0
void efxRestOBJ_Loop(void)
{
    gEfxBgSemaphore--;
    return;
}
