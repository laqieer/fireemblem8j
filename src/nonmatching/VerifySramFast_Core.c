/* NON_MATCHING (permuter-pilot): byte source is asm/VerifySramFast_Core.s @ JP
 * 0x080D6460 (region-different). This C is functionally correct (ported from US
 * agb_sram.c) but agbcc allocates 2 bytes differently in the
 * `REG_WAITCNT = (REG_WAITCNT & ~3) | 3` statement: the JP build keeps the
 * loaded WAITCNT value in r0 and the mask in r1; agbcc reverses them (value->r1,
 * mask->r0), producing a 2-byte diff at +0x0A/+0x0D that ~80k permuter iterations
 * did not close (it is a backend register-allocation choice the AST randomizer
 * does not influence). Compiled only by `make nonmatching`; NOT in the oracle. */
#include "global.h"
#include "agb_sram.h"

u32 VerifySramFast_Core(const u8 *src, u8 *dest, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
    while (--size != -1)
    {
        if (*dest++ != *src++)
            return (u32)(dest - 1);
    }
    return 0;
}
