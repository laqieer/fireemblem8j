#include "global.h"
#include "bmtrick.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "bmarch.h"

extern inline s8 IsBallista(struct Trap* trap) {
    if (!trap) {
        return 0;
    }
    if (trap->type != TRAP_BALLISTA) {
        return 0;
    }
    return 1;
}
extern inline int GetBallistaItemUses(struct Trap* trap) {
    if (!IsBallista(trap)) {
        return 0;
    }
    return trap->data[TRAP_EXTDATA_BLST_ITEMUSES];
}
extern inline int GetBallistaItem(struct Trap* trap) {
    if (!IsBallista(trap)) {
        return 0;
    }
    return trap->extra + trap->data[TRAP_EXTDATA_BLST_ITEMUSES] * 0x100;
}

int GetBallistaItemAt(int xPos, int yPos) {
    struct Trap* trap = GetTrapAt(xPos, yPos);

    if (GetBallistaItemUses(trap) == 0) {
        return 0;
    }

    return GetBallistaItem(trap);
}
