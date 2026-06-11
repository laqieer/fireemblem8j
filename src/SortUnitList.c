#include "global.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "statscreen.h"
#include "mu.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "constants/songs.h"

//! FE8U = 0x08092BF0
bool SortUnitList(u8 key, u8 order)
{
    u8 cache[0x40];
    u8 r2 = order & 1;

    #define PREPARE_VARS \
        bool changed = FALSE; \
        u8 i, j, tmp_cache; \
        void * tmp_addr;

    #define BUILD_CACHE(key) \
    { \
        for (i = 0; i < gUnitlistscreen_8; i++) \
        { \
            cache[i] = key(i); \
        } \
    }

    #define RETURN_IF_CHANGED if (changed) return TRUE;

    #define SWAP(i, j) \
    { \
        tmp_addr = gSortedUnits[(i)]; \
        gSortedUnits[(i)] = gSortedUnits[(j)]; \
        gSortedUnits[(j)] = tmp_addr; \
    }

    #define SWAP_CACHE(i, j) \
    { \
        tmp_cache = cache[(i)]; \
        cache[(i)] = cache[(j)]; \
        cache[(j)] = tmp_cache; \
        SWAP(i, j) \
    }

    #define SORT_CORE_KEY(key, arrow, swap) \
    { \
        /* this is a bubble sort, I think */ \
        for (i = 0; i < gUnitlistscreen_8 - 1; i++) \
        { \
            for (j = 0; j < gUnitlistscreen_8 - 1 - i; j++) \
            { \
                if (key(j + 1) arrow key(j)) \
                { \
                    /* swap */ \
                    swap(j, j + 1) \
                    changed = TRUE; \
                } \
            } \
        } \
    }

    #define SORT_CORE(cond, swap) \
    { \
        /* this is a bubble sort, I think */ \
        for (i = 0; i < gUnitlistscreen_8 - 1; i++) \
        { \
            for (j = 0; j < gUnitlistscreen_8 - 1 - i; j++) \
            { \
                if (cond) \
                { \
                    /* swap */ \
                    swap(j, j + 1) \
                    changed = TRUE; \
                } \
            } \
        } \
    }

    #define SORT_REAL(cond_asc, cond_dsc) \
        if (r2 == 0) \
        { \
            PREPARE_VARS \
            SORT_CORE(cond_asc, SWAP) \
            RETURN_IF_CHANGED \
        } \
        else \
        { \
            PREPARE_VARS \
            SORT_CORE(cond_dsc, SWAP) \
            RETURN_IF_CHANGED \
        }

    #define SORT(cond) SORT_REAL(cond, !(cond))

    #define SORT_BY_KEY(key) \
        if (r2 == 0) \
        { \
            PREPARE_VARS \
            SORT_CORE_KEY(key, >, SWAP) \
            RETURN_IF_CHANGED \
        } \
        else \
        { \
            PREPARE_VARS \
            SORT_CORE_KEY(key, <, SWAP) \
            RETURN_IF_CHANGED \
        }

    #define SORT_MAIN(sort_a, sort_b) \
        if (r2 == 0) \
        { \
            PREPARE_VARS \
            sort_a \
            RETURN_IF_CHANGED \
        } \
        else \
        { \
            PREPARE_VARS \
            sort_b \
            RETURN_IF_CHANGED \
        } \
        break;

    #define COND_FIELD(field) ((gSortedUnits[j + 1]->field) < (gSortedUnits[j]->field))
    #define COND_UNIT_FIELD(field) COND_FIELD(unit->field)

    #define SORT_BY_FUNC(func) \
        SORT_REAL(func(gSortedUnits[j + 1]->unit) > func(gSortedUnits[j]->unit), \
            func(gSortedUnits[j + 1]->unit) < func(gSortedUnits[j]->unit))

    #define SORT_BY_UNIT_FIELD(field) \
        SORT_REAL((gSortedUnits[j + 1]->unit->field) > (gSortedUnits[j]->unit->field), \
            (gSortedUnits[j + 1]->unit->field) < (gSortedUnits[j]->unit->field))

    switch (key)
    {
        case UNITLIST_SORTKEY_1:
            #define KEY_A(i) (gSortedUnits[(i)]->unit->pCharacterData->sort_order)
            #define KEY_B(i) (gSortedUnits[(i)]->unit->state & US_UNSELECTABLE)

            SORT_MAIN(
                SORT_CORE_KEY(KEY_A, <, SWAP) SORT_CORE_KEY(KEY_B, <, SWAP),
                SORT_CORE_KEY(KEY_A, >, SWAP) SORT_CORE_KEY(KEY_B, >, SWAP))

            #undef KEY_B
            #undef KEY_A

        case UNITLIST_SORTKEY_3:
            #define KEY(i) (gSortedUnits[(i)]->unit->level)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_2:
            #define KEY(i) (gSortedUnits[(i)]->unit->pClassData->sort_order)
            SORT_MAIN(SORT_CORE_KEY(KEY, <, SWAP), SORT_CORE_KEY(KEY, >, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_4:
            SORT_BY_UNIT_FIELD(exp)
            break;

        case UNITLIST_SORTKEY_5:
            SORT_BY_FUNC(GetUnitCurrentHp)
            break;

        case UNITLIST_SORTKEY_6:
            SORT_BY_FUNC(GetUnitMaxHp)
            break;

        case UNITLIST_SORTKEY_7:
            SORT_BY_FUNC(GetUnitPower)
            break;

        case UNITLIST_SORTKEY_8:
            SORT_BY_FUNC(GetUnitSkill)
            break;

        case UNITLIST_SORTKEY_9:
            SORT_BY_FUNC(GetUnitSpeed)
            break;

        case UNITLIST_SORTKEY_10:
            SORT_BY_FUNC(GetUnitLuck)
            break;

        case UNITLIST_SORTKEY_11:
            SORT_BY_FUNC(GetUnitDefense)
            break;

        case UNITLIST_SORTKEY_12:
            SORT_BY_FUNC(GetUnitResistance)
            break;

        case UNITLIST_SORTKEY_19:
            SORT_BY_FUNC(UNIT_CON)
            break;

        case UNITLIST_SORTKEY_20:
            SORT_BY_FUNC(GetUnitAid)
            break;

        case UNITLIST_SORTKEY_13:
            #define KEY(i) (GetUnitAffinityIcon(gSortedUnits[(i)]->unit))
            SORT_MAIN(SORT_CORE_KEY(KEY, <, SWAP), SORT_CORE_KEY(KEY, >, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_14:
            SORT_MAIN(
            {
                for (i = 0; i < gUnitlistscreen_8; i++)
                {
                    cache[i] = GetItemIndex(GetUnitEquippedWeapon(gSortedUnits[i]->unit));
                }

                for (i = 0; i < gUnitlistscreen_8 - 1; i++)
                {
                    for (j = 0; j < gUnitlistscreen_8 - 1 - i; j++)
                    {
                        if (cache[j + 1] > cache[j])
                        {
                            SWAP_CACHE(j, j + 1)
                            changed = TRUE;
                        }
                        else if (cache[j + 1] == cache[j] && GetUnitEquippedWeapon(gSortedUnits[j + 1]->unit) > GetUnitEquippedWeapon(gSortedUnits[j]->unit))
                        {
                            SWAP_CACHE(j, j + 1)
                            changed = TRUE;
                        }
                    }
                }
            },
            {
                for (i = 0; i < gUnitlistscreen_8; i++)
                {
                    cache[i] = GetItemIndex(GetUnitEquippedWeapon(gSortedUnits[i]->unit));
                }

                for (i = 0; i < gUnitlistscreen_8 - 1; i++)
                {
                    for (j = 0; j < gUnitlistscreen_8 - 1 - i; j++)
                    {
                        if (cache[j + 1] < cache[j])
                        {
                            SWAP_CACHE(j, j + 1)
                            changed = TRUE;
                        }
                        else if (cache[j + 1] == cache[j] && GetUnitEquippedWeapon(gSortedUnits[j + 1]->unit) < GetUnitEquippedWeapon(gSortedUnits[j]->unit))
                        {
                            SWAP_CACHE(j, j + 1)
                            changed = TRUE;
                        }
                    }
                }
            })

        case UNITLIST_SORTKEY_15:
            #define KEY(i) (gSortedUnits[(i)]->battleAttack)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_16:
            #define KEY(i) (gSortedUnits[(i)]->battleHitRate)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_17:
            #define KEY(i) (gSortedUnits[(i)]->battleAvoidRate)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_18:
            SORT_BY_FUNC(UNIT_MOV)
            break;

        case UNITLIST_SORTKEY_21:
            SORT_BY_UNIT_FIELD(statusIndex)
            break;

        case UNITLIST_SORTKEY_22:
            SORT_MAIN(
            {
                for (i = 0; i < gUnitlistscreen_8; i++)
                {
                    if ((gSortedUnits[i]->unit->state & US_RESCUING) != 0)
                        cache[i] = 1;
                    else
                        cache[i] = 0;
                }

                SORT_CORE(cache[j + 1] > cache[j], SWAP_CACHE)
            },
            {
                for (i = 0; i < gUnitlistscreen_8; i++)
                {
                    if ((gSortedUnits[i]->unit->state & US_RESCUING) != 0)
                        cache[i] = 1;
                    else
                        cache[i] = 0;
                }

                SORT_CORE(cache[j + 1] < cache[j], SWAP_CACHE)
            })

        case UNITLIST_SORTKEY_23:
            SORT_BY_UNIT_FIELD(ranks[0])
            break;

        case UNITLIST_SORTKEY_24:
            SORT_BY_UNIT_FIELD(ranks[1])
            break;

        case UNITLIST_SORTKEY_25:
            SORT_BY_UNIT_FIELD(ranks[2])
            break;

        case UNITLIST_SORTKEY_26:
            SORT_BY_UNIT_FIELD(ranks[3])
            break;

        case UNITLIST_SORTKEY_27:
            SORT_BY_UNIT_FIELD(ranks[4])
            break;

        case UNITLIST_SORTKEY_28:
            SORT_BY_UNIT_FIELD(ranks[5])
            break;

        case UNITLIST_SORTKEY_29:
            SORT_BY_UNIT_FIELD(ranks[6])
            break;

        case UNITLIST_SORTKEY_30:
            SORT_BY_UNIT_FIELD(ranks[7])
            break;

        case UNITLIST_SORTKEY_31:
            #define KEY(i) (gSortedUnits[(i)]->supportCount)
            SORT_MAIN(SORT_CORE_KEY(KEY, >, SWAP), SORT_CORE_KEY(KEY, <, SWAP))
            #undef KEY

        case UNITLIST_SORTKEY_32:
            SORT_BY_FUNC(SortUnitList_GetUnitSoloAnimation)
            break;
    }

    return FALSE;
}
