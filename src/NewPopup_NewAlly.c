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



int sub_801153C();

void NewPopup_NewAlly(ProcPtr parent, u8 char_id)
{
    sub_801153C(GetUnitFromCharId(char_id));
    NewPopup_Simple(PopupScr_NewAlly, 0x60, 0x0, parent);
}
