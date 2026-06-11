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

void DisplayTexts(const struct SSTextDispInfo* infos)
{
    while (infos->text)
    {
        if (infos->mid)
        {
            PutDrawText(
                infos->text,
                infos->tilemap,
                infos->color,
                infos->xoff, 0,
                GetStringFromIndex(*infos->mid));
        }
        else
        {
            PutText(infos->text, infos->tilemap);
        }

        ++infos;
    }
}
