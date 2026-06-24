#include "global.h"

#include "bmunit.h"
#include "prepscreen.h"
#include "chapterdata.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "bmusemind.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmmind.h"
#include "bmbattle.h"
#include "mu.h"
#include "ekrbattle.h"
#include "mapanim.h"
#include "bmtrick.h"
#include "ctc.h"
#include "muctrl.h"
#include "cgtext.h"
#include "eventcall.h"

#include "constants/items.h"

extern u16 ItemBackupEvtBattle;

void EvtBattleGenerateReal(struct Unit * unitA, struct Unit * unitB);
void EvtBattleGenerateBallistaReal(struct Unit * unitA, struct Unit * unitB);
void StartScriptBattleAnim(int useMapAnims);

//! FE8U = 0x08011F5C
void StartEventBattle(struct Unit * unitA, struct Unit * unitB, s8 isBallista, s8 scripted_hit, u16 item, struct BattleHit * hits, s8 useMapAnims)
{
    int sp04;
    int tmp;

    SetBattleScripted();

    sp04 = 0;
    if (hits == NULL)
    {
        sp04 = 1;
    }

    gActionData.scriptedBattleHits = (sp04 == 0) ? hits : NULL;

    if ((GetItemType(unitA->items[0]) == ITYPE_STAFF) || (item != 0))
    {
        BattleInitItemEffect(unitA, 0);
        BattleInitItemEffectTarget(unitB);
    }
    else if (!isBallista)
    {
        EvtBattleGenerateReal(unitA, unitB);
    }
    else
    {
        EvtBattleGenerateBallistaReal(unitA, unitB);
    }

    gBattleActor.weaponBefore = gBattleActor.weapon = GetUnitEquippedWeapon(unitA);
    tmp = 0x0000FFFF;
    gBattleTarget.weaponBefore = gBattleTarget.weapon = GetUnitEquippedWeapon(unitB);

    ItemBackupEvtBattle = tmp;

    if (item != 0)
    {
        switch (GetItemType(item))
        {
            case ITYPE_SWORD:
            case ITYPE_LANCE:
            case ITYPE_AXE:
            case ITYPE_BOW:
            case ITYPE_ANIMA:
            case ITYPE_LIGHT:
            case ITYPE_DARK:
            case ITYPE_MONSTER:
                ItemBackupEvtBattle = unitA->items[0];
                unitA->items[0] = MakeNewItem(item);

                if (!isBallista)
                {
                    EvtBattleGenerateReal(unitA, unitB);
                }
                else
                {
                    EvtBattleGenerateBallistaReal(unitA, unitB);
                }

                gBattleActor.weapon = MakeNewItem(item);
                gBattleActor.weaponBefore = MakeNewItem(item);

                item = 0;
                break;

            case ITYPE_STAFF:
            case ITYPE_ITEM:
            case ITYPE_DRAGN:
            case ITYPE_DANCE:
            case 0xFF:
                gBattleActor.weaponBefore = gBattleActor.weapon = item + 0x100;

                switch (item)
                {
                    case ITEM_FILLAS_MIGHT:
                    case ITEM_NINISS_GRACE:
                    case ITEM_THORS_IRE:
                    case ITEM_SETS_LITANY:
                        gBattleStats.config = BATTLE_CONFIG_DANCERING;
                        break;
                }

                break;
        }
    }

    gBattleActor.expGain = 0;
    gBattleTarget.expGain = 0;

    if ((item != 0) && (sp04 == 0))
    {
        ClearBattleHits();

        while (1)
        {
            *gBattleHitIterator = *hits;
            if (hits->info & BATTLE_HIT_INFO_END)
            {
                break;
            }

            BattleHitAdvance();
            hits++;
        }

        BattleHitTerminate();
    }

    if (scripted_hit == 0)
    {
        /* Here we can also calc battle real */
        unitA->curHP = gBattleActor.unit.curHP;
        unitB->curHP = gBattleTarget.unit.curHP;

        SetBattleUnscripted();

        gActionData.scriptedBattleHits = NULL;

        if (ItemBackupEvtBattle != 0x0000FFFF)
        {
            GetUnit(gBattleActor.unit.index)->items[0] = ItemBackupEvtBattle;
        }
    }
    else
    {
        UnitBeginAction(unitA);
        HideUnitSprite(gActiveUnit);
        StartMu(gActiveUnit);
        SetAutoMuDefaultFacing();

        if ((GetItemType(unitA->items[0]) == ITYPE_STAFF) || (item != 0))
        {
            gActionData.unitActionType = UNIT_ACTION_STAFF;
        }
        else
        {
            gActionData.unitActionType = UNIT_ACTION_COMBAT;
        }

        StartScriptBattleAnim(useMapAnims);

        gAiDecision.xMove = unitA->xPos;
        gAiDecision.yMove = unitA->yPos;
    }
}
