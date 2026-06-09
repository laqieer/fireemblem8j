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






























void PopupProc_Init(struct PopupProc * proc)
{
    proc->xTileParam = -1;
    proc->yTileParam = -1;
    proc->textColorId = TEXT_COLOR_SYSTEM_WHITE;
    proc->iconId = -1;
    proc->iconX = 0;
    proc->soundId = 0;
}
