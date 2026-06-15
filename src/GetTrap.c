#include "global.h"
#include "bmtrick.h"

extern struct Trap sTrapPool[];

struct Trap *GetTrap(int id)
{
    return &sTrapPool[id];
}
