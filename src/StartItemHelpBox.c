#include "global.h"
#include <stdlib.h>
#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"
#include "statscreen.h"
#include "constants/songs.h"



void StartItemHelpBox(int x, int y, int item)
{
    sMutableHbi.adjUp    = NULL;
    sMutableHbi.adjDown  = NULL;
    sMutableHbi.adjLeft  = NULL;
    sMutableHbi.adjRight = NULL;

    sMutableHbi.xDisplay = x;
    sMutableHbi.yDisplay = y;
    sMutableHbi.mid      = item;

    sMutableHbi.redirect = NULL;
    sMutableHbi.populate = HbPopulate_AutoItem;

    sHbOrigin.x = 0;
    sHbOrigin.y = 0;

    StartHelpBoxExt(&sMutableHbi, FALSE);
}
