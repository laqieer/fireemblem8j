#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void SpellFx_ClearBG1Position(void)
{
    BG_SetPosition(BG_1, 0, 0);
}
