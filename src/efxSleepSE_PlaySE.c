#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

//! FE8U = 0x08062968
void efxSleepSE_PlaySE(struct ProcEfx * proc)
{
    PlaySFX(0x11c, 0x100, proc->anim->xPosition, 1);
    return;
}
