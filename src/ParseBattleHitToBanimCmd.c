#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "spellassoc.h"
#include "bmbattle.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "constants/classes.h"
#include "constants/items.h"

#define ANIM_REF_OFFSET(off_ref_round, off_ref_pos) ((off_ref_round) * 2 + off_ref_pos)

//! FE8J = 0x08059034
void ParseBattleHitToBanimCmd(void)
{
    u32 i;
    struct BattleHit * hit; // r7
    u16 r9;
    u16 r10;
    u16 sp00[2];
    struct BattleUnit * bul_sp04;
    struct BattleUnit * bur_sp08;
    s32 round_sp0C;
    s32 is_enemy;
    s32 distance_sp14;
    s32 distance_sp18;
    s32 distance_sp1C;
    s32 is_dark_breath;

    hit = gBattleHitArray;

    for (i = 0; i < 20; i++)
        gAnimRoundData[i] = 0xFFFF;

    for (i = 0; i < 20; i++)
        gEfxHpLut[2 + i] = 0xFFFF;

    gpEkrTriangleUnits[0] = gpEkrTriangleUnits[1] = NULL;

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gAnimRoundData[0] = 4;
        gAnimRoundData[1] = 4;
        return;
    }

    if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
    {
        gAnimRoundData[0] = 6;
        gAnimRoundData[1] = 0;
        return;
    }

    distance_sp18 = gEkrDistanceType;
    distance_sp14 = distance_sp18;

    is_dark_breath = false;

    bul_sp04 = gpEkrBattleUnitLeft;
    bur_sp08 = gpEkrBattleUnitRight;

    if (GetItemIndex(bul_sp04->weaponBefore) == ITEM_SWORD_RUNESWORD && distance_sp14 == EKR_DISTANCE_CLOSE)
        distance_sp14 = EKR_DISTANCE_FAR;
    if (GetItemIndex(bur_sp08->weaponBefore) == ITEM_SWORD_RUNESWORD && distance_sp18 == EKR_DISTANCE_CLOSE)
        distance_sp18 = EKR_DISTANCE_FAR;

    if (GetItemIndex(bul_sp04->weaponBefore) == ITEM_AXE_HANDAXE && distance_sp14 == EKR_DISTANCE_CLOSE)
        distance_sp14 = EKR_DISTANCE_FAR;
    if (GetItemIndex(bur_sp08->weaponBefore) == ITEM_AXE_HANDAXE && distance_sp18 == EKR_DISTANCE_CLOSE)
        distance_sp18 = EKR_DISTANCE_FAR;

    if (GetItemIndex(bul_sp04->weaponBefore) == ITEM_AXE_TOMAHAWK && distance_sp14 == EKR_DISTANCE_CLOSE)
        distance_sp14 = EKR_DISTANCE_FAR;
    if (GetItemIndex(bur_sp08->weaponBefore) == ITEM_AXE_TOMAHAWK && distance_sp18 == EKR_DISTANCE_CLOSE)
        distance_sp18 = EKR_DISTANCE_FAR;

    if (GetItemIndex(bul_sp04->weaponBefore) == ITEM_AXE_HATCHET && distance_sp14 == EKR_DISTANCE_CLOSE)
        distance_sp14 = EKR_DISTANCE_FAR;
    if (GetItemIndex(bur_sp08->weaponBefore) == ITEM_AXE_HATCHET && distance_sp18 == EKR_DISTANCE_CLOSE)
        distance_sp18 = EKR_DISTANCE_FAR;

    gEfxHpLut[0] = gEkrGaugeHp[0];
    gEfxHpLut[1] = gEkrGaugeHp[1];

    round_sp0C = 0;
    r10 = 0;
    r9 = 0;
    for (; !(hit->info & BATTLE_HIT_INFO_END); hit++, round_sp0C++)
    {
        s16 r3;
        s32 distance_r4;
        u16 * r5;
        struct Unit * unit_r6;
        u16 * r8;

        if (hit->info & BATTLE_HIT_INFO_RETALIATION)
            is_enemy = true;
        else
            is_enemy = false;

        if (gBanimPositionIsEnemy[POS_L] == is_enemy)
        {
            r5 = &sp00[POS_L];
            r8 = &sp00[POS_R];
            distance_r4 = distance_sp14;
            distance_sp1C = distance_sp18;
            unit_r6 = &bul_sp04->unit;
            r3 = is_dark_breath;

            if (round_sp0C == 0)
                gEkrInitialHitSide = POS_L;
        }
        else
        {
            r5 = &sp00[POS_R];
            r8 = &sp00[POS_L];
            distance_r4 = distance_sp18;
            distance_sp1C = distance_sp14;
            unit_r6 = &bur_sp08->unit;
            r3 = 0;

            if (round_sp0C == 0)
                gEkrInitialHitSide = POS_R;
        }

        if (hit->attributes & BATTLE_HIT_ATTR_TATTACK)
        {
            gpEkrTriangleUnits[0] = gBattleStats.taUnitA;
            gpEkrTriangleUnits[1] = gBattleStats.taUnitB;
        }

        if (hit->attributes & BATTLE_HIT_ATTR_CRIT)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gBattleparse_2[distance_r4];
            else
                *r5 = gBattleparse_6[distance_r4];
        }
        else if (hit->attributes & BATTLE_HIT_ATTR_SILENCER)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gBattleparse_2[distance_r4];
            else
                *r5 = gBattleparse_6[distance_r4];
        }
        else if (r3 == 0)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gBattleparse_0[distance_r4];
            else
                *r5 = gBattleparse_5[distance_r4];
        }
        else
        {
            switch (LCGRand_N(2)) {
            case 0:
                *r5 = gBattleparse_7[distance_r4];
                break;

            case 1:
                *r5 = gBattleparse_8[distance_r4];
                break;

            case 2:
                *r5 = gBattleparse_9[distance_r4];
                break;

            default:
                break;
            }
        }

        if (hit->attributes & BATTLE_HIT_ATTR_MISS)
        {
            if (!UnitHasMagicRank(unit_r6))
                *r5 = gBattleparse_1[distance_r4];
            else
                *r5 = gBattleparse_5[distance_r4];

            *r8 = gBattleparse_3[distance_sp1C];
        }
        else
        {
            *r8 = gBattleparse_4[distance_sp1C];
        }

        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = sp00[POS_L];
        r8 = sp00;
        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = r8[sp00 - r8 + POS_R];

        if (!(hit->attributes & BATTLE_HIT_ATTR_MISS))
        {
            s16 new_hp;

            if (hit->attributes & BATTLE_HIT_ATTR_DEVIL)
            {
                if (gBanimPositionIsEnemy[POS_L] == is_enemy)
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r9, POS_L)) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r9++;
                    gEfxHpLut[ANIM_REF_OFFSET(r9, POS_L)] = new_hp;
                    gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] | ANIM_ROUND_DEVIL; /* r5 */
                }
                else
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r10, POS_R)) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r10++;
                    gEfxHpLut[ANIM_REF_OFFSET(r10, POS_R)] = new_hp;
                    gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] | ANIM_ROUND_DEVIL; /* r4 */
                }
            }
            else if (hit->attributes & BATTLE_HIT_ATTR_HPSTEAL)
            {
                if (gBanimPositionIsEnemy[POS_L] == is_enemy)
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r10, POS_R)) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r10++;
                    gEfxHpLut[ANIM_REF_OFFSET(r10, POS_R)] = new_hp;

                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r9, POS_L)) + hit->hpChange;
                    if (new_hp > gBanimMaxHP[POS_L])
                        new_hp = gBanimMaxHP[POS_L];

                    r9++;
                    gEfxHpLut[ANIM_REF_OFFSET(r9, POS_L)] = new_hp;
                }
                else
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r9, POS_L)) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r9++;
                    gEfxHpLut[ANIM_REF_OFFSET(r9, POS_L)] = new_hp;

                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r10, POS_R)) + hit->hpChange;
                    if (new_hp > gBanimMaxHP[POS_R])
                        new_hp = gBanimMaxHP[POS_R];

                    r10++;
                    gEfxHpLut[ANIM_REF_OFFSET(r10, POS_R)] = new_hp;
                }
            }
            else
            {
                if (gBanimPositionIsEnemy[POS_L] == is_enemy)
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r10, POS_R)) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r10++;
                    gEfxHpLut[ANIM_REF_OFFSET(r10, POS_R)] = new_hp;

                    if (hit->attributes & BATTLE_HIT_ATTR_POISON)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] | ANIM_ROUND_POISON;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_SILENCER)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] | ANIM_ROUND_SILENCER;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_SURESHOT)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] | ANIM_ROUND_SURE_SHOT;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_PIERCE)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] | ANIM_ROUND_PIERCE;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_GREATSHLD)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] | ANIM_ROUND_GREAT_SHIELD;
                    }
                }
                else
                {
                    new_hp = GetEfxHp(ANIM_REF_OFFSET(r9, POS_L)) - hit->hpChange;
                    if (new_hp < 0)
                        new_hp = 0;

                    r9++;
                    gEfxHpLut[ANIM_REF_OFFSET(r9, POS_L)] = new_hp;

                    if (hit->attributes & BATTLE_HIT_ATTR_POISON)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_L)] | ANIM_ROUND_POISON;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_SILENCER)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] | ANIM_ROUND_SILENCER;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_SURESHOT)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] | ANIM_ROUND_SURE_SHOT;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_PIERCE)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] | ANIM_ROUND_PIERCE;
                    }

                    if (hit->attributes & BATTLE_HIT_ATTR_GREATSHLD)
                    {
                        gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] = (s16)gAnimRoundData[ANIM_REF_OFFSET(round_sp0C, POS_R)] | ANIM_ROUND_GREAT_SHIELD;
                    }
                }
            }
        }
    }
}
