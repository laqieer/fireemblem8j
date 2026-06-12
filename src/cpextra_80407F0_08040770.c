#include "global.h"
#include "cp_common.h"
#include "cp_utility.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmphase.h"
#include "bmbattle.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"
/* TU-private aggregate type defs (file-local) */
struct AiSpecialItemLutEntry {
    u16 itemId;
    void(*func)(int itemIdx);
};
/* TU-private data externs bound at their JP addresses */
extern const struct AiSpecialItemLutEntry sAiSpecialItemFuncLut[];

int GetSpecialItemFuncIndex(u16 item) {
    int index = 0;
    u16 itemId = GetItemIndex(item);

    for (; sAiSpecialItemFuncLut[index].itemId != 0; index++) {
        if (itemId != sAiSpecialItemFuncLut[index].itemId) {
            continue;
        }

        if (sAiSpecialItemFuncLut[index].func != 0) {
            return index;
        }
    }

    return -1;
}
