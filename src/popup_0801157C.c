#include "global.h"
#include "proc.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "icon.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "ctc.h"
#include "bmlib.h"
#include "popup.h"
#include "functions.h"
#include "variables.h"
#include "constants/characters.h"
#include "constants/items.h"

ProcPtr NewPopupCore(const struct PopupInstruction *inst,
                           int clock,
                           int winStyle,
                           int iconObjTileId,
                           int pal_base, /* proc->iconPalId - 0x10 */
                           ProcPtr parent)
{
    struct PopupProc * proc;

    proc = (0 != parent)
         ? Proc_StartBlocking(ProcScr_Popup, parent)
         : Proc_Start(ProcScr_Popup, PROC_TREE_3);

    proc->clock = clock;
    proc->pDefinition = inst;
    proc->winStyle = winStyle;
    proc->iconObjTileId = iconObjTileId;
    proc->iconPalId = pal_base + 0x10;

    return proc;
}
