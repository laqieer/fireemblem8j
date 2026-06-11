#include "global.h"
#include "constants/terrains.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmphase.h"
#include "bmunit.h"
#include "mu.h"
#include "proc.h"
#include "rng.h"
#include "bmarch.h"
#include "bmmind.h"
#include "bmidoten.h"

void RevertMovementScript(u8* begin, u8* end)
{
    u8 buffer[MOVE_CMD_MAX_COUNT];

    u8* it = buffer;

    while (end > begin)
        *it++ = *--end;

    *it = MOVE_CMD_HALT;

    for (it = buffer; *it != MOVE_CMD_HALT;)
        *begin++ = *it++;

    *begin = MOVE_CMD_HALT;
}
