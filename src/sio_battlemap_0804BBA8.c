#include "global.h"

#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bm.h"
#include "bmio.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "icon.h"
#include "uimenu.h"
#include "bksel.h"
#include "bmbattle.h"
#include "uiutils.h"
#include "bmmind.h"
#include "popup.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "ctc.h"
#include "scene.h"
#include "helpbox.h"
#include "mapanim.h"
#include "ekrbattle.h"
#include "event.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/msg.h"
#include "constants/songs.h"
#include "constants/terrains.h"

/* prototypes for same-file helpers called by this run */
void LinkArenaBattleMap_StartUnitMoveOut(u8 a, int b, u8 * c, int * xOut, int * yOut);
void LABattleMap_StartMuAndSavePosition(struct Unit * unit, int idx, int * xOut, int * yOut);
int GetUnitBestWeaponPower(struct Unit * unit);

//! FE8U = 0x0804AE08
int LABattleMap_GetTeamCombatScore(int playerId)
{
    int i;

    int count = 0;
    int score = 0;

    for (i = playerId; i < playerId + 5; i++)
    {
        struct Unit * unit = GetUnit(i);

        if ((unit->state & (US_DEAD | US_BIT16)) != 0)
        {
            continue;
        }

        if (unit->pCharacterData == NULL)
        {
            continue;
        }

        count++;

        score += GetUnitBestWeaponPower(unit);
        score += GetUnitCurrentHp(unit);
    }

    score += gUnk_Sio_16.currentScore[playerId >> 6];

    score = Div(score, count);

    return score;
}

//! FE8U = 0x0804AE7C
bool LABattleMap_PollSurrenderHeld(struct SioBattleMapProc * proc, int b)
{
    if ((gKeyStatusPtr->heldKeys & START_BUTTON) != 0)
    {
        EndLinkArenaPointsBox();
        proc->unk_58 = b;

        if (!gPlaySt.config.disableSoundEffects)
        {
            // Another non-usage of the PlaySoundEffects macro
            m4aSongNumStart(SONG_68);
            Proc_Goto(proc, 3);
        }

        return true;
    }

    return false;
}

//! FE8U = 0x0804AEC4
void LABattleMap_AiPickWeakestTeam(ProcPtr proc)
{
    int i;

    int bestScore = -1;

    if (LABattleMap_PollSurrenderHeld(proc, 0) == true)
    {
        return;
    }

    for (i = 0; i < 4; i++)
    {
        u32 score;

        if (!Sio_IsPlayerConnected(i))
        {
            continue;
        }

        if (gUnk_Sio_16.unk_0A[i] == 0)
        {
            continue;
        }

        if (gPlaySt.faction == i)
        {
            continue;
        }

        score = LABattleMap_GetTeamCombatScore(i * 0x40 + 1);

        if (bestScore <= score)
        {
            continue;
        }

        bestScore = score;
        gUnk_Sio_16.unk_02 = i;
    }

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0804AF2C
int ITEMRANGEDONE_Stub_0(int unused, struct Unit * unit)
{
    u16 weapon = GetUnitEquippedWeapon(unit);

    if (weapon == 0)
    {
        return 1;
    }

    if (GetItemMaxRange(weapon) == 1)
    {
        return 1;
    }

    if (GetItemMinRange(weapon) > 1)
    {
        return 2;
    }

    return 1;
}

//! FE8U = 0x0804AF5C
void LABattleMap_AiPickBestAttack(struct SioBattleMapProc * proc)
{
    struct AiCombatSimulationSt sim;
    int i;
    int bestSlot;
    int slot;
    int allegiance;

    int bestScore = 0;
    u8 selectedUnitId = 0;
    u8 targetUnitId = 0;

    if (LABattleMap_PollSurrenderHeld(proc, 1) == true)
    {
        return;
    }

    gAiState.combatWeightTableId = 0xe;
    allegiance = gPlaySt.faction * 0x40;

    for (i = allegiance + 1; i < allegiance + 6; i++)
    {
        gActiveUnitId = i;
        gActiveUnit = GetUnit(gActiveUnitId);

        if ((gActiveUnit->state & (US_DEAD | US_BIT16)) != 0)
        {
            continue;
        }

        if (gActiveUnit->pCharacterData == NULL)
        {
            continue;
        }

        for (slot = 0; slot < UNIT_ITEM_COUNT; slot++)
        {
            int targetFaction;
            int j;
            int flags;

            u16 item = gActiveUnit->items[slot];

            if (item == 0)
            {
                continue;
            }

            if (!CanUnitUseWeapon(gActiveUnit, item))
            {
                continue;
            }

            bestSlot = slot;
            flags = 0;

            if (GetItemMinRange(item) > 2)
            {
                continue;
            }

            if ((GetItemAttributes(item) & IA_UNCOUNTERABLE) != 0)
            {
                continue;
            }

            if (GetItemMinRange(item) == 1)
            {
                flags |= 2;
            }

            if (GetItemMaxRange(item) > 1)
            {
                flags |= 1;
            }

            sim.itemSlot = bestSlot;

            targetFaction = gUnk_Sio_16.unk_02 * 0x40;

            for (j = targetFaction + 1; j < targetFaction + 6; j++)
            {
                struct AiCombatSimulationSt * simp = &sim;
                int flags2;
                u8 * r7 = gUnk_45;
                struct Unit * unit = GetUnit(j);

                if ((unit->state & (US_DEAD | US_BIT16)) != 0)
                {
                    continue;
                }

                if (unit->pCharacterData == NULL)
                {
                    continue;
                }

                flags2 = flags & 2; // permuter
                simp->targetId = j;

                if (((u8)flags2) != 0)
                {
                    simp->xMove = unit->xPos + 1;
                    simp->yMove = unit->yPos;

                    AiSimulateBattleAgainstTargetAtPosition(&sim);

                    if (bestScore <= sim.score)
                    {
                        bestScore = sim.score;
                        selectedUnitId = gActiveUnitId;
                        targetUnitId = j;

                        if (flags == 3)
                        {
                            r7[2] = ITEMRANGEDONE_Stub_0(3, unit);
                        }
                        else
                        {
                            r7[2] = 1;
                        }
                        r7[3] = bestSlot;
                    }
                }

                if ((flags & 1) != 0)
                {
                    simp->xMove = unit->xPos + 1;
                    simp->yMove = unit->yPos - 1;

                    AiSimulateBattleAgainstTargetAtPosition(&sim);

                    if (bestScore <= sim.score)
                    {
                        bestScore = sim.score;
                        selectedUnitId = gActiveUnitId;
                        targetUnitId = j;

                        if (flags == 3)
                        {
                            r7[2] = ITEMRANGEDONE_Stub_0(3, unit);
                        }
                        else
                        {
                            r7[2] = 2;
                        }
                        r7[3] = bestSlot;
                    }
                }
            }
        }
    }

    LinkArenaBattleMap_StartUnitMoveOut(selectedUnitId, 0, &gUnk_Sio_16.unk_04, &proc->unk_2c, &proc->unk_30);
    gUnk_45[1] = targetUnitId;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0804B190
void LABattleMap_Ai_StartTargetCursor(ProcPtr proc)
{
    struct Unit * unit = GetUnit(gUnk_45[1]);

    StartAiTargetCursor(unit->xPos * 16, unit->yPos * 16, 2, proc);

    return;
}

//! FE8U = 0x0804B1C0
void LABattleMap_Ai_PrepareCombatants(struct SioProc85AA4CC * proc)
{
    struct Unit * unitA;
    struct Unit * unitB;

    LinkArenaBattleMap_StartUnitMoveOut(gUnk_45[1], 1, &gUnk_Sio_16.unk_05, &proc->unk_34, &proc->unk_38);

    unitA = GetUnit(gUnk_42[gUnk_Sio_16.unk_04]);
    unitB = GetUnit(gUnk_42[gUnk_Sio_16.unk_05]);

    if ((unitA->state & US_BIT9) != 0)
    {
        LABattleMap_StartMuAndSavePosition(unitA, 0, &proc->unk_2c, &proc->unk_30);
    }

    if ((unitB->state & US_BIT9) != 0)
    {
        LABattleMap_StartMuAndSavePosition(unitB, 1, &proc->unk_34, &proc->unk_38);
    }

    return;
}

//! FE8U = 0x0804B250
void LABattleMap_Ai_WaitCombatantMu(ProcPtr proc)
{
    if (LABattleMap_PollSurrenderHeld(proc, 2) == 1)
    {
        return;
    }

    if (MuExistsActive() != 0)
    {
        return;
    }

    Proc_Break(proc);

    return;
}
