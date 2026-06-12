#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "bmcontainer.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmarena.h"

#include "constants/characters.h"

#include "prepscreen.h"

int CheckInLinkArena(void);

//! FE8U = 0x08098048
void SortPrepScreenItemsByPage(int page)
{
    int j;
    int i;
    int k;

    struct PrepScreenItemListEnt* buffer = gPrepscreen_0;
    gPrepscreen_2 = 0;

    for (i = 0; i < gPrepscreen_1; i++) {
        u8 itemType = GetItemType(gPrepScreenItemList[i].item);

        if (itemType < gPrepItemTypePageLut[page].lowerBound) {
            continue;
        }

        if (itemType > gPrepItemTypePageLut[page].upperBound) {
            continue;
        }

        *buffer = gPrepScreenItemList[i];
        buffer++;

        gPrepscreen_2++;
    }

    for (i = 0; i < gPrepscreen_1; i++) {
        u8 itemType = GetItemType(gPrepScreenItemList[i].item);

        if (itemType < gPrepItemTypePageLut[page].lowerBound || itemType > gPrepItemTypePageLut[page].upperBound) {
            *buffer = gPrepScreenItemList[i];
            buffer++;
        }
    }

    j = 1;

    while (1) {
        if (j >= gPrepscreen_2 / 3) {
            break;
        }

        j = j * 3 + 1;
    }

    for (; j > 0; j = j / 3) {
       for (i = j; i < gPrepscreen_2; i++) {
            for (k = i - j; k >= 0; k -= j) {
                int a = GetItemIndex(gPrepscreen_0[k].item);
                int b = GetItemIndex(gPrepscreen_0[k + j].item);

                if (a > b) {
                    struct PrepScreenItemListEnt t = gPrepscreen_0[k];
                    gPrepscreen_0[k] = gPrepscreen_0[k + j];
                    gPrepscreen_0[k + j] = t;
                } else {
                    if (GetItemIndex(gPrepscreen_0[k].item) != GetItemIndex(gPrepscreen_0[k + j].item)) {
                        break;
                    }

                    if (gPrepscreen_0[k].item > gPrepscreen_0[k + j].item) {
                        struct PrepScreenItemListEnt t = gPrepscreen_0[k];
                        gPrepscreen_0[k] = gPrepscreen_0[k + j];
                        gPrepscreen_0[k + j] = t;
                    }
                }


            }
        }
    }

    CpuFastSet(gPrepscreen_0, gPrepScreenItemList, 0x190);

    return;
}
