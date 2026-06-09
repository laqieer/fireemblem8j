#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "bm.h"
#include "bb.h"

void SubtitleHelpDarkener_FadeIn()
{
    if (gBmSt.altBlendACa != 0)
        gBmSt.altBlendACa--;
}
