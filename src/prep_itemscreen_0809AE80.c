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

int CheckInLinkArena(void);

extern EWRAM_OVERLAY(0) struct Text gPrepItemTexts[32];







/* prototypes for same-file helpers called by this run */
void PrepItemDrawPopupBox(int x, int y, int w, int h, int oam2);

//! FE8U = 0x08098BA8
void PrepItem_DrawItemListBox(void)
{
    PrepItemDrawPopupBox(8, 92, 10, 5, OAM2_CHR(0x40) + OAM2_LAYER(1) + OAM2_PAL(10));
    return;
}
