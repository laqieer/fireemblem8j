#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "bmidoten.h"
#include "mu.h"
#include "chapterdata.h"
#include "face.h"
#include "scene.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "gamecontrol.h"
#include "uimenu.h"
#include "prepscreen.h"
#include "playerphase.h"
#include "bmbattle.h"
#include "popup.h"
#include "muctrl.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "cgtext.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "constants/backgrounds.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "bmfx.h"
#include "colorfade.h"
#include "constants/songs.h"

s8 ShouldUNITBeLoaded(const struct UnitDefinition * unitDefinition, u8 unk);

//! FE8U = 0x0800F6E0
void EventLoadUnitSliently(const struct UnitDefinition * def, s16 count, u8 param)
{
    s8 r3 = (param == 2) ? TRUE : FALSE;

    for (; def->charIndex && count > 0; ++def)
    {
        if (ShouldUNITBeLoaded(def, param) != TRUE)
            continue;

        LoadUnit_0(def, 1, TRUE, r3);
        count--;
    }
}
