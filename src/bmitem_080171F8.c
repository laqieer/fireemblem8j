#include "global.h"

#include "constants/items.h"

#include "fontgrp.h"
#include "icon.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "bmcontainer.h"

#include "bmitem.h"

/* prototypes for same-file helpers called by this run */
int GetConvoyItemCostSum(void);
int GetUnitItemCostSum(void);

int GetPartyTotalGoldValue(void) {
    int result = 0;

    result += GetConvoyItemCostSum();
    result += GetUnitItemCostSum();
    result += GetPartyGoldAmount();

    if (result > 9999999) // TODO: use a constant?
        result = 9999999;

    return result;
}
