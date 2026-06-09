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

/**
* "MuCtr" proc and related functions
* Handles REDA Interpretation
*/

//! FE8U = 0x08079CD8
struct REDA * CopyEventMoveREDAs(const struct REDA * redas, u8 count)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (((gEventREDAs.usedBuffers >> i) & 1) == 0)
        {
            struct REDA * buffer = gEventREDAs.buf[i];

            while (count != 0)
            {
                *buffer++ = *redas++;
                count--;
            }

            gEventREDAs.usedBuffers |= (1 << i);
            return gEventREDAs.buf[i];
        }
    }
}

//! FE8U = 0x08079D40
void ClearEventMoveBuffer(const struct REDA * redas)
{
    u8 i;
    for (i = 0; i < 4; i++)
    {
        if (gEventREDAs.buf[i] == redas)
        {
            gEventREDAs.usedBuffers &= ~(1 << i);
            return;
        }
    }
}
