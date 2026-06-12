#include "global.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x08098500
void EndDrawPrepFundsSprite(void)
{
    Proc_End(Proc_Find(gProcScr_DrawPrepFundsSprite));
    return;
}
