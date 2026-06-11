#include "global.h"
#include "constants/items.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "event.h"
#include "bmmap.h"
#include "statscreen.h"
#include "bm.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "bksel.h"
#include "helpbox.h"

void PutBattleForecastItemName(u16* dest, struct Text * text, int itemIdx)
{
    char* str = GetItemName(itemIdx);
    int position = GetStringTextCenteredPos(56, str);

    ClearText(text);
    PutDrawText(text, dest, 0, position, 0, str);
}
