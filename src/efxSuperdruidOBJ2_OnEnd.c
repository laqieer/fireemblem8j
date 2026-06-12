#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x08065624
void efxSuperdruidOBJ2_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}
