#include "global.h"
#include "bmunit.h"
#include "mu.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "muctrl.h"

void MuCtr_InitDefinedMove(struct MuCtrlProc * proc, struct Unit * unit, const struct REDA * redas, s16 count, u16 flags)
{
    struct Vec2 pos;
    const struct REDA * reda;
    s8 x = unit->xPos;
    s8 y = unit->yPos;

    // ????
    reda = &redas[count + 1];
    reda -= 2;

    pos.x = reda->x;
    pos.y = reda->y;

    AdjustNewUnitPosition(unit, &pos, flags);

    proc->unit = unit;
    proc->muProc = StartMu(unit);
    proc->redas = redas;
    proc->redaCount = count;
    proc->timer = 0;
    proc->delayFrames = redas->delayFrames;
    proc->flags = flags;
    proc->x = pos.x;
    proc->y = pos.y;
    proc->unk_42 = x;
    proc->unk_43 = y;

    HideUnitSprite(unit);

    unit->state |= US_HIDDEN;

    if (gBmMapUnit[unit->yPos][unit->xPos] == (u8)unit->index)
    {
        gBmMapUnit[unit->yPos][unit->xPos] = 0;
    }

    gBmMapOther[y][x] = 0;
    gBmMapOther[pos.y][pos.x] = unit->pCharacterData->number;

    HideMu(proc->muProc);
}
