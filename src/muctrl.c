#include "global.h"

#include "bmunit.h"
#include "mu.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "hardware.h"
#include "cp_utility.h"
#include "bmidoten.h"
#include "rng.h"
#include "bmtrick.h"

#include "muctrl.h"

/* prototypes for same-file helpers called by this run */
void ClearEventMoveBuffer(const struct REDA * redas);
void MoveUnit_(struct Unit * unit, s8 x, s8 y, u16 flags);
u8 * MuCtr_GenMoveScript(struct Unit * unit, struct Vec2 * pos, s8 flag);

//! FE8U = 0x0807A1FC
void MuCtr_OnEnd(struct MuCtrlProc * proc)
{
    struct MuProc * muProc = proc->muProc;
    struct Unit * unit = proc->unit;

    if ((muProc->fast_walk_b != 0) && (proc->redaCount != 0))
    {
        MoveUnit_(unit, proc->x, proc->y, proc->flags & 0xFFFE);
    }
    else
    {
        unit->xPos = proc->x;
        unit->yPos = proc->y;
        UnitFinalizeMovement(unit);

        ShowUnitSprite(unit);
        unit->state &= ~US_HIDDEN;

        gBmMapUnit[unit->yPos][unit->xPos] = unit->index;

        RefreshEntityBmMaps();
        RefreshUnitSprites();
    }

    EndMu(muProc);
    SortMus();

    ClearEventMoveBuffer(proc->redas);

    return;
}

// clang-format on

//! FE8U = 0x0807A294
s8 MuCtr_CheckMoveDependency(u8 pid, u16 b)
{
    if (pid == 0)
    {
        return true;
    }

    gUnk_53 = pid;
    gUnk_52 = true;

    Proc_ForEach(ProcScr_MuCtrl, (ProcFunc)MuCtr_FindMovingUnit);

    if ((gUnk_52 == 0) && (b != 0xFFFF))
    {
        gUnk_54 = b;
        gUnk_52 = 0;
        Proc_ForEach(ProcScr_MuCtrl, (ProcFunc)MuCtr_CheckUnitPassedStep);
    }

    return gUnk_52;
}

//! FE8U = 0x0807A300
void MuCtr_FindMovingUnit(struct MuCtrlProc * proc)
{
    if (proc->unit->pCharacterData->number == gUnk_53)
        gUnk_52 = 0;
}

//! FE8U = 0x0807A324
void MuCtr_CheckUnitPassedStep(struct MuCtrlProc * proc)
{
    if (proc->unit->pCharacterData->number == gUnk_53 && gUnk_54 < proc->timer)
        gUnk_52 = true;
}

//! FE8U = 0x0807A358
void MuCtr_ExecREDA_0(struct MuCtrlProc * proc)
{
    u8 * commands;
    u8 config;
    struct Vec2 pos;

    struct Unit * unit = proc->unit;
    const struct REDA * reda = proc->redas + proc->timer;
    u16 flagsA = proc->flags;
    int flagsB = flagsA;

    gBmMapOther[proc->y][proc->x] = 0;

    if (proc->timer < (proc->redaCount - 1))
    {
        pos.x = reda->x;
        pos.y = reda->y;
        flagsB &= 0xfffe;
    }
    else
    {
        pos.x = proc->x;
        pos.y = proc->y;

        if ((flagsA & 2) != 0)
        {
            flagsB &= 0xfffe;
        }
    }

    commands = MuCtr_GenMoveScript(unit, &pos, flagsB & 1);

    gBmMapOther[proc->y][proc->x] = unit->pCharacterData->number;

    if ((proc->unk_42 != pos.x) || (proc->unk_43 != pos.y))
    {
        struct MuProc * muProc = proc->muProc;

        ShowMu(muProc);
        SetMuMoveScript(muProc, commands);

        config = reda->flags;

        if ((flagsB & 8) != 0)
        {
            config |= 0x40;
        }

        SetMuConfig(muProc, config);

        if ((flagsB & 4) != 0)
        {
            EnableMuCamera(muProc);
        }
        else
        {
            DisableMuCamera(muProc);
        }

        HideUnitSprite(unit);
        unit->state |= US_HIDDEN;

        if (gBmMapUnit[unit->yPos][unit->xPos] == (u8)unit->index)
        {
            gBmMapUnit[unit->yPos][unit->xPos] = 0;
        }

        RefreshUnitSprites();

        proc->unk_42 = pos.x;
        proc->unk_43 = pos.y;
    }

    return;
}
