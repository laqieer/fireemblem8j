#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

//! FE8U = 0x08062934
void efxSleepOBJ_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}
