#include "global.h"
#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmitem.h"
#include "bmshop.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "bmunit.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "constants/faces.h"
#include "constants/songs.h"



void WmSell_DrawSupplyDialogueSpriteText(void);
extern int  gShopSellTextIndexLookup[];
extern char *  gpShopSellStringBuffer;

void WmSell_ShowDialoguePrompt(int index, ProcPtr parent) {

    StartParallelWorker(WmSell_DrawSupplyDialogueSpriteText, parent);

    NewSysboxText(
        0x7000,
        13,
        GetStringFromIndexInBuffer(gShopSellTextIndexLookup[index], gpShopSellStringBuffer),
        1,
        1,
        1,
        parent
    );

    return;
}
