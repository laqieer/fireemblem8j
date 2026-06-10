#include "global.h"
#include "face.h"
#include "anime.h"
#include "proc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "ekrlevelup.h"
#include "constants/songs.h"

/**
 * section.text
 */

bool CheckEkrLvupDone(void)
{
    if (gpProcEkrLevelup->finished == true)
        return true;
    else
        return false;
}
