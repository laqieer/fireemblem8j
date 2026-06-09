#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void SpellFx_Begin(void)
{
    gEfxSpellAnimExists = true;
}

void SpellFx_Finish(void)
{
    gEfxSpellAnimExists = false;
}
