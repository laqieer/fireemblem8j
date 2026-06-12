#include "global.h"
#include "gba/m4a_internal.h"

void Clear64byte(void *x)
{
    void (*func)(void *) = *(&gMPlayJumpTable[35]);
    func(x);
}
