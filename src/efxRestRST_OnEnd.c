#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

void efxRestRST_OnEnd(struct ProcEfx *proc)
{
    gEfxBgSemaphore--;
}
