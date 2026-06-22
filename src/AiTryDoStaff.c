#include "global.h"
#include "cp_common.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmphase.h"
#include "cp_utility.h"
#include "constants/items.h"

struct AiStaffLutEntry {
    /* 00 */ u16 itemId;
    /* 04 */ void (*func)(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
};

extern const struct AiStaffLutEntry sAiStaffFuncLut[];
int GetAiStaffFuncIndex(u16 item);

//! FE8U = 0x0803F9C0
s8 AiTryDoStaff(s8 (*isEnemy)(struct Unit* unit)) {
    int i;

    u8 exp = 0;

    if (gActiveUnit->statusIndex == UNIT_STATUS_SILENCED) {
        return gAiDecision.actionPerformed;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        int funcIndex;
        u16 item = gActiveUnit->items[i];

        if (item == 0) {
            break;
        }

        if (!(GetItemAttributes(item) & IA_STAFF)) {
            continue;
        }

        if (GetItemRequiredExp(item) < exp) {
            continue;
        }

        funcIndex = GetAiStaffFuncIndex(item);

        if (funcIndex == -1) {
            continue;
        }

        sAiStaffFuncLut[funcIndex].func(i, isEnemy);

        if (gAiDecision.actionPerformed != 0) {
            exp = GetItemRequiredExp(item);
        }
    }

    return gAiDecision.actionPerformed;
}
