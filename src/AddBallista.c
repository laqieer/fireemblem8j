#include "global.h"
#include "bmtrick.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "bmarch.h"

static inline void ClearBallistaOccupied(struct Trap* trap) {
    trap->data[TRAP_EXTDATA_BLST_RIDDEN] = 0;
    return;
}

struct Trap* AddBallista(int xPos, int yPos, int ballistaType) {
    struct Trap* trap = AddTrap(xPos, yPos, 1, 0);

    trap->extra = GetItemIndex(ballistaType);
    trap->data[TRAP_EXTDATA_BLST_ITEMUSES] = GetItemUses(MakeNewItem(ballistaType));

    ClearBallistaOccupied(trap);

    return trap;
}
