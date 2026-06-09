#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"





/* prototypes for same-file helpers called by this run */
bool IsPlaythroughIdUnique(int index);

int GetNewPlaythroughId(void)
{
    int i;
    for (i = 1; i < 0x100; i++)
        if (IsPlaythroughIdUnique(i))
            return i;
}
