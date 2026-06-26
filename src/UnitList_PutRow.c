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
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "sio.h"

#include "unitlistscreen.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(0) struct SortedUnitEnt * gSortedUnits[0x40];
extern EWRAM_OVERLAY(0) struct Text gUnitlistscreen_2[7];
extern EWRAM_OVERLAY(0) struct Text gUnitlistscreen_3[7][3];

char * sub_801729C(int item);

//! FE8U = 0x08092FF0
void UnitList_PutRow(struct UnitListScreenProc * proc, u8 unitNum, u16 * tm, u8 page, s8 putName)
{
    u8 inactive;
    u8 i;
    u8 num;
    int row;
    int y;
    int icon;

    row = unitNum % 7;
    y = (unitNum * 2) & 0x1F;

    if ((gSortedUnits[unitNum]->unit->state & US_NOT_DEPLOYED) != 0)
        inactive = 1;
    else
        inactive = 0;

    if (putName != 0)
    {
        ClearText(&gUnitlistscreen_2[row]);
        Text_SetCursor(&gUnitlistscreen_2[row], 0);

        if (!CheckInLinkArena() && proc->mode == UNITLIST_MODE_PREPMENU &&
            IsCharacterForceDeployed(gSortedUnits[unitNum]->unit->pCharacterData->number))
        {
            Text_SetColor(&gUnitlistscreen_2[row], TEXT_COLOR_SYSTEM_GREEN);
        }
        else
        {
            Text_SetColor(&gUnitlistscreen_2[row], inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE);
        }

        Text_DrawString(
            &gUnitlistscreen_2[row], GetStringFromIndex(gSortedUnits[unitNum]->unit->pCharacterData->nameTextId));
        PutText(&gUnitlistscreen_2[row], tm + y * 0x20 + 3);
    }

    ClearText(&gUnitlistscreen_3[row][0]);
    ClearText(&gUnitlistscreen_3[row][1]);

    TileMap_FillRect(tm + y * 0x20 + 8, 0x18, 1, 0);

    switch (page)
    {
        case UNITLIST_PAGE_SOLOANIM:
            PutDrawText(
                &gUnitlistscreen_3[row][0], tm + y * 0x20 + 8, 0, 0, 0,
                GetStringFromIndex(gSortedUnits[unitNum]->unit->pClassData->nameTextId));
            Text_SetColor(&gUnitlistscreen_3[row][1], inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE);

            if (GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit) == 0)
            {
                PutDrawText(
                    &gUnitlistscreen_3[row][1], tm + y * 0x20 + 17,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, GetStringFromIndex(0x4C7));
            }
            else
            {
                PutDrawText(
                    &gUnitlistscreen_3[row][1], tm + y * 0x20 + 17,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0,
                    sub_801729C(GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit)));
                DrawIcon(
                    tm + y * 0x20 + 15, GetItemIconId(GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit)),
                    TILEREF(0, 4));
                UnitList_RegisterEquippedIcon(GetItemIconId(GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit)));
            }

            ClearText(&gUnitlistscreen_3[row][2]);

            switch (gSortedUnits[unitNum]->unit->state & US_SOLOANIM)
            {
                case US_SOLOANIM_1:
                    PutDrawText(&gUnitlistscreen_3[row][2], tm + y * 0x20 + 24, 4, 8, 0, GetStringFromIndex(0x38));
                    break;

                case US_SOLOANIM_2:
                    PutDrawText(&gUnitlistscreen_3[row][2], tm + y * 0x20 + 24, 4, 8, 0, GetStringFromIndex(0x39));
                    break;

                case 0:
                    PutDrawText(&gUnitlistscreen_3[row][2], tm + y * 0x20 + 24, 1, 4, 0, GetStringFromIndex(0x37));
                    break;
            }

            break;

        case UNITLIST_PAGE_1:
        {
            register u16 * p asm("r4");
            // class
            PutDrawText(
                &gUnitlistscreen_3[row][0], tm + y * 0x20 + 8,
                inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 4, 0,
                GetStringFromIndex(gSortedUnits[unitNum]->unit->pClassData->nameTextId));

            p = tm + y * 0x20;
            // level
            PutNumberOrBlank(
                p + 17, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gSortedUnits[unitNum]->unit->level);

            // exp
            PutNumberOrBlank(
                p + 20, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gSortedUnits[unitNum]->unit->exp);

            // hp
            PutNumberOrBlank(
                p + 23, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                GetUnitCurrentHp(gSortedUnits[unitNum]->unit));
            PutSpecialChar(p + 24, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0x16);
            PutNumberOrBlank(
                p + 26, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                GetUnitMaxHp(gSortedUnits[unitNum]->unit));

            break;
        }

        case UNITLIST_PAGE_2:
            PutNumberOrBlank(
                tm + y * 0x20 + 9,
                UNIT_POW_MAX(gSortedUnits[unitNum]->unit) == gSortedUnits[unitNum]->unit->pow ? 4 : 2,
                GetUnitPower(gSortedUnits[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 12,
                UNIT_SKL_MAX(gSortedUnits[unitNum]->unit) == gSortedUnits[unitNum]->unit->skl ? 4 : 2,
                GetUnitSkill(gSortedUnits[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 15,
                UNIT_SPD_MAX(gSortedUnits[unitNum]->unit) == gSortedUnits[unitNum]->unit->spd ? 4 : 2,
                GetUnitSpeed(gSortedUnits[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 18,
                UNIT_LCK_MAX(gSortedUnits[unitNum]->unit) == gSortedUnits[unitNum]->unit->lck ? 4 : 2,
                GetUnitLuck(gSortedUnits[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 21,
                UNIT_DEF_MAX(gSortedUnits[unitNum]->unit) == gSortedUnits[unitNum]->unit->def ? 4 : 2,
                GetUnitDefense(gSortedUnits[unitNum]->unit));
            PutNumberOrBlank(
                tm + y * 0x20 + 24,
                UNIT_RES_MAX(gSortedUnits[unitNum]->unit) == gSortedUnits[unitNum]->unit->res ? 4 : 2,
                GetUnitResistance(gSortedUnits[unitNum]->unit));

            icon = GetUnitAffinityIcon(gSortedUnits[unitNum]->unit);

            if (icon == -1)
            {
                PutSpecialChar(tm + y * 0x20 + 26, 2, TEXT_SPECIAL_DASH);
            }
            else
            {
                DrawIcon(tm + y * 0x20 + 26, icon, TILEREF(0, 4 + 1));
            }

            break;

        case UNITLIST_PAGE_3:
            if (GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit) == 0)
            {
                PutDrawText(
                    &gUnitlistscreen_3[row][0], tm + y * 0x20 + 10,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, GetStringFromIndex(0x4C7));
            }
            else
            {
                char const * name = sub_801729C(GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit));

                PutDrawText(
                    &gUnitlistscreen_3[row][0], tm + y * 0x20 + 10,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, name);

                DrawIcon(
                    tm + y * 0x20 + 8, GetItemIconId(GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit)),
                    TILEREF(0, 4));
                UnitList_RegisterEquippedIcon(GetItemIconId(GetUnitEquippedWeapon(gSortedUnits[unitNum]->unit)));
            }

            PutNumberOrBlank(
                tm + y * 0x20 + 18, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gSortedUnits[unitNum]->battleAttack);

            PutNumberOrBlank(
                tm + y * 0x20 + 22, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gSortedUnits[unitNum]->battleHitRate);

            PutNumberOrBlank(
                tm + y * 0x20 + 26, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                gSortedUnits[unitNum]->battleAvoidRate);

            break;

        case UNITLIST_PAGE_4:
            if ((gSortedUnits[unitNum]->unit->state & US_RESCUING) != 0)
            {
                PutDrawText(
                    &gUnitlistscreen_3[row][1], tm + y * 0x20 + 18,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0,
                    GetUnitRescueName(gSortedUnits[unitNum]->unit));
            }
            else
            {
                PutDrawText(
                    &gUnitlistscreen_3[row][1], tm + y * 0x20 + 18,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, GetStringFromIndex(0x4C6));
            }

            PutNumberOrBlank(
                tm + y * 0x20 + 10, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                UNIT_MOV(gSortedUnits[unitNum]->unit));

            PutNumberOrBlank(
                tm + y * 0x20 + 13, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                UNIT_CON(gSortedUnits[unitNum]->unit));

            PutNumberOrBlank(
                tm + y * 0x20 + 16, inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_BLUE,
                GetUnitAid(gSortedUnits[unitNum]->unit));

            PutDrawText(
                &gUnitlistscreen_3[row][0], tm + y * 0x20 + 23,
                inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0,
                GetUnitStatusName(gSortedUnits[unitNum]->unit));

            break;

        case UNITLIST_PAGE_WEXP:
        {
            for (i = 0; i < 8; i++)
            {
                const int wpnLevelRankChars[] =
                {
                    [WPN_LEVEL_0] = TEXT_SPECIAL_DASH,
                    [WPN_LEVEL_E] = TEXT_SPECIAL_E,
                    [WPN_LEVEL_D] = TEXT_SPECIAL_D,
                    [WPN_LEVEL_C] = TEXT_SPECIAL_C,
                    [WPN_LEVEL_B] = TEXT_SPECIAL_B,
                    [WPN_LEVEL_A] = TEXT_SPECIAL_A,
                    [WPN_LEVEL_S] = TEXT_SPECIAL_S,
                };

                num = GetWeaponLevelFromExp(gSortedUnits[unitNum]->unit->ranks[i]);

                PutSpecialChar(tm + y * 0x20 + 10 + 2 * i, num == WPN_LEVEL_S ? TEXT_COLOR_SYSTEM_GREEN : 2, wpnLevelRankChars[num]);
            }

            break;
        }

        default:
        {
            u8 supportStart;
            u8 supportPassed;
            int supportCount;

            supportStart = (page - UNITLIST_PAGE_SUPPORT) * 3;
            supportPassed = 0;
            num = 0;
            supportCount = GetUnitSupporterCount(gSortedUnits[unitNum]->unit);

            ClearText(&gUnitlistscreen_3[row][2]);

            for (i = 0; i < supportCount; i++)
            {
                if (CanUnitSupportNow(gSortedUnits[unitNum]->unit, i))
                {
                    if (supportPassed >= supportStart)
                    {
                        struct Unit * other = GetUnitSupporterUnit(gSortedUnits[unitNum]->unit, i);

                        // ?? Why cast to u16?
                        if (((u16)(other->state & US_NOT_DEPLOYED)) == 0)
                        {
                            char const * name = GetStringFromIndex(
                                (GetCharacterData(GetUnitSupporterCharacter(gSortedUnits[unitNum]->unit, i)))
                                    ->nameTextId);

                            PutDrawText(
                                &gUnitlistscreen_3[row][num], tm + y * 0x20 + 9 + num * 6,
                                inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, name);
                        }
                        else
                        {
                            char const * name = GetStringFromIndex(
                                (GetCharacterData(GetUnitSupporterCharacter(gSortedUnits[unitNum]->unit, i)))
                                    ->nameTextId);

                            PutDrawText(
                                &gUnitlistscreen_3[row][num], tm + y * 0x20 + 9 + num * 6, TEXT_COLOR_SYSTEM_GRAY, 0, 0,
                                name);
                        }

                        num++;

                        if (num == 3)
                            break;
                    }
                    else
                    {
                        supportPassed++;
                    }
                }
            }

            for (; num < 3; num++)
            {
                PutDrawText(
                    &gUnitlistscreen_3[row][num], tm + y * 0x20 + 9 + num * 6,
                    inactive ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE, 0, 0, GetStringFromIndex(0x4C6));
            }

            break;
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}
