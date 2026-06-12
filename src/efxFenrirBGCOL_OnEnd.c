#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

//! FE8U = 0x08060BC4
void efxFenrirBGCOL_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}
