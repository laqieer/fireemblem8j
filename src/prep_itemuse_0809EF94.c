#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "bmbattle.h"
#include "bmudisp.h"
#include "bm.h"
#include "statscreen.h"
#include "scene.h"
#include "face.h"
#include "icon.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "classchg.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"

#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"

bool CheckInLinkArena(void);

// TODO: Implicit declaration?
int CanUnitUseItemPrepScreen(struct Unit* unit, int item);

void StartPrepItemUseScreen(struct Unit *unit, ProcPtr parent)
{
    struct ProcPrepItemUse *proc;
    proc = Proc_StartBlocking(ProcScr_PrepItemUseScreen, parent);
    proc->unit = unit;
}
