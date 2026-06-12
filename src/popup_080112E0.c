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


















extern struct PopupInstruction CONST_DATA PopupScr_GoldWasStole[];







extern struct PopupInstruction CONST_DATA PopupScr_WRankUp[];



void PopupProc_MaybeSetVolume(struct PopupProc * proc)
{
    if (0 != proc->soundId)
        StartBgmVolumeChange(0x100, 0x80, 0x10, (ProcPtr)proc);
}
