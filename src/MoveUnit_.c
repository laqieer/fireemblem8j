#include "global.h"
#include "muctrl.h"

void MoveUnit_(struct Unit * unit, s8 x, s8 y, u16 flags)
{
    struct REDA reda;

    reda.x = x;
    reda.y = y;

    MoveUnitExt(unit, &reda, 1, flags);
}
