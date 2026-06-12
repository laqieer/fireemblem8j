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

extern EWRAM_OVERLAY(0) struct Text gaBattleForecastTextStructs[6];
extern EWRAM_OVERLAY(0) u16 gBkselPals[8][16];

void PutBattleForecastUnitName(u16 * dest, struct Text * text, struct Unit * unit)
{
    char* str = GetStringFromIndex(unit->pCharacterData->nameTextId);
    int position = GetStringTextCenteredPos(48, str);

    ClearText(text);
    PutDrawText(text, dest, 0, position, 0, str);
}
