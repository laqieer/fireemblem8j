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




void ConvoyMenuProc_ExecBootlegPopup(ProcPtr proc)
{
    if (HasConvoyAccess())
    {
        if (gConvoyItemCount < CONVOY_ITEM_COUNT)
            NewPopup2_SendItem(proc, gActionData.item);
        else
            NewPopup2_DropItem(proc, gActionData.item);
    }
    else
        NewPopup2_DropItem(proc, gActionData.item);
}
