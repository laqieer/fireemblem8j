#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmcontainer.h"
#include "icon.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bb.h"
#include "bmunit.h"
#include "bmmenu.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmmind.h"
#include "popup.h"
#include "face.h"
#include "scene.h"
#include "helpbox.h"
#include "menuitempanel.h"
#include "prepscreen.h"

void HandleNewItemGetFromDrop(struct Unit* unit, int item, ProcPtr proc)
{
    u8 ret = UnitAddItem(unit, item);
    if (FALSE != ret)
        return;

    gActiveUnit = unit;
    gBmSt.um_tmp_item = item;
    StartFace(0, GetUnitPortraitId(unit), 0xB0, 4, 2);
    SetFaceBlinkControlById(0, 5);
    ForceMenuItemPanel(proc, unit, 0xF, 0xA);

    if (HasConvoyAccess() && GetConvoyItemCount() < CONVOY_ITEM_COUNT)
        /* Your inventory is full. Send an item to Supply.[.] */
        StartSubtitleHelp(proc, GetStringFromIndex(0x7E5));
    else
        /* Your inventory is full. Select an item to discard. */
        StartSubtitleHelp(proc, GetStringFromIndex(0x7E4));

    SetTalkChoiceResult(TALK_CHOICE_NO);
    Proc_StartBlocking(gProcCmd_ConvoyMenu, proc);
}
