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
int GetWeaponLevelFromExp(int wexp);

int GetDisplayRankStringFromExp(int wexp) {
    u8 rankTextIdLookup[] = {
        // TODO: TEXT ID CONSTANTS
        0x14, 0x1D, 0x1C, 0x1B, 0x1A, 0x19, 0x18
    };

    return rankTextIdLookup[GetWeaponLevelFromExp(wexp)];
}

char * GetWeaponTypeDisplayString(int wpnType) {
    int wtypeTextIdLookup[] = {
        // TODO: TEXT ID CONSTANTS
        0x494, 0x495, 0x496, 0x497, // Sword, Lance, Axe, Box
        0x498, 0x49D, 0x49E, 0x49F, // Staff, Anima, Light, Dark
        0x4A0, 0x4A1, 0x4A2,        // Item, Bllsta, Dragon
    };

#if BUGFIX
    if (wpnType > ITYPE_DRAGN)
        return NULL;
#endif

    return GetStringFromIndex(wtypeTextIdLookup[wpnType]);
}

void GetWeaponExpProgressState(int wexp, int* outValue, int* outMax) {
    switch (GetWeaponLevelFromExp(wexp)) {

    case WPN_LEVEL_0:
        *outValue = 0;
        *outMax = 0;
        return;

    case WPN_LEVEL_E:
        *outValue = wexp      - WPN_EXP_E;
        *outMax   = WPN_EXP_D - WPN_EXP_E;
        return;

    case WPN_LEVEL_D:
        *outValue = wexp      - WPN_EXP_D;
        *outMax   = WPN_EXP_C - WPN_EXP_D;
        return;

    case WPN_LEVEL_C:
        *outValue = wexp      - WPN_EXP_C;
        *outMax   = WPN_EXP_B - WPN_EXP_C;
        return;

    case WPN_LEVEL_B:
        *outValue = wexp      - WPN_EXP_B;
        *outMax   = WPN_EXP_A - WPN_EXP_B;
        return;

    case WPN_LEVEL_A:
        *outValue = wexp      - WPN_EXP_A;
        *outMax   = WPN_EXP_S - WPN_EXP_A;
        return;

    case WPN_LEVEL_S:
        *outValue = 0;
        *outMax = 0;
        return;

    } // switch (GetWeaponLevelFromExp(wexp))
}
