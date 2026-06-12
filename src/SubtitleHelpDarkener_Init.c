#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "bm.h"
#include "bb.h"

void SubtitleHelpDarkener_Init()
{
    gBmSt.altBlendACa = 8;
    SetPrimaryHBlankHandler(SubtitleHelpDarkenerOnHBlank);

    return;
}
