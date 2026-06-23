#include "global.h"
#include "constants/items.h"
#include "bmtrick.h"

void AddGorgonEggTrap(s8 x, s8 y, u8 meta, u8 delay, u8 level)
{
    AddDamagingTrap(x, y, TRAP_GORGON_EGG, meta, delay, 1, level);
}
