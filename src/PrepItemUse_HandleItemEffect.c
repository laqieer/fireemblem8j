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

void PrepItemUse_HandleItemEffect(struct ProcPrepItemUse * proc)
{
    switch (GetItemIndex(proc->unit->items[proc->slot])) {
    case ITEM_HEAVENSEAL:
    case ITEM_HEROCREST:
    case ITEM_KNIGHTCREST:
    case ITEM_ORIONSBOLT:
    case ITEM_ELYSIANWHIP:
    case ITEM_GUIDINGRING:
    case ITEM_MASTERSEAL:
    case ITEM_OCEANSEAL:
    case ITEM_LUNARBRACE:
    case ITEM_SOLARBRACE:
    case ITEM_UNK_C1:
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_EXEC_PROMO);
        break;

    case ITEM_JUNAFRUIT:
        Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_EXEC_JUNA);
        break;

        default:
        break;
    }
}
