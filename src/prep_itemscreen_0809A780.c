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







// clang-format on

//! FE8U = 0x080984A8
void StartDrawPrepFundsSprite(int x, int y, int pal, ProcPtr parent)
{
    struct DrawFundsSpriteProc * proc = Proc_Start(gProcScr_DrawPrepFundsSprite, parent);
    proc->visible = false;
    proc->x = x;
    proc->y = y;
    proc->pal = pal;
    return;
}
