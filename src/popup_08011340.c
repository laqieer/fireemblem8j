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



void PopupIconUpdateProc_Loop(struct PopupIconUpdateProc * proc)
{
    CallARM_PushToSecondaryOAM(proc->unk_2C, 
                               proc->unk_30, 
                               gObject_16x16, 
                               proc->unk_4A);
}
