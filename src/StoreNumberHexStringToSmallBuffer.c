#include "global.h"
#include "fontgrp.h"

void ClearSmallStringBuffer(void);

/* The hexDigits "0123456789ABCDEF" string is the JP region-different data at
 * 0x080DC3DC (inside the frontier_df4_misc_lo data blob). Reference it as an
 * extern so the literal pool relocates against that fixed address. */
extern const char sHexDigits[];

void StoreNumberHexStringToSmallBuffer(int n)
{
    int i;

    ClearSmallStringBuffer();
    for (i = 7; i >= 0; i--)
    {
        gNumberStr[i] = sHexDigits[(n & 0xF)];
        n >>= 4;
        if (n == 0)
            break;
    }
}
