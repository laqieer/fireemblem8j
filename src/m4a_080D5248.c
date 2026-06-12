#include "global.h"
#include "gba/m4a_internal.h"

void ClearChain(void *x)
{
    void (*func)(void *) = *(&gMPlayJumpTable[34]);
    func(x);
}
