#include "global.h"
extern struct ProcCmd gBmlib_1[];
#include "variables.h"
#include "functions.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"
#include "spline.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "constants/songs.h"

bool MapPaletteBrightnessFadeExists(void)
{
    if (Proc_Find(gBmlib_1) != NULL)
        return true;

    return false;
}
