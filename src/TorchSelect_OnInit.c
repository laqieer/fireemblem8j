#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "ap.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtarget.h"
#include "bmtrick.h"
#include "uiutils.h"
#include "uimenu.h"
#include "uiselecttarget.h"
#include "playerphase.h"
#include "bb.h"
#include "face.h"
#include "bm.h"
#include "unitinfowindow.h"
#include "eventinfo.h"
#include "bmmenu.h"
#include "menu_def.h"
#include "menuitempanel.h"
#include "bmmind.h"
#include "worldmap.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "bmitemuse.h"
#include "constants/songs.h"

void TorchSelect_OnInit(struct WarpSelectProc* proc)
{
    gBmSt.gameStateBits |= GMAP_STATE_BIT0;

    StartSubtitleHelp(proc,
        GetStringFromIndex(0x7FA)); // TODO: msgid "Select an area to light up."

    if (IsCameraNotWatchingPosition(gActiveUnit->xPos, gActiveUnit->yPos))
        EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
}
