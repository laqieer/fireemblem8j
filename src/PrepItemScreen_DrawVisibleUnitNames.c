#include "global.h"

/*
 * JP 0x0809C7D4 PrepItemScreen_DrawVisibleUnitNames.
 *
 * The JP build sign-extends `flag` once at entry (asrs r6, r1, #24) and reuses
 * the value through the loop with a plain `adds r2, r6, #0` -- it never re-narrows
 * per iteration the way the fe8u u8/s8 codegen does. To reproduce this we:
 *   - cast `flag` to `(s8)` into an `int` local, forcing the single entry
 *     sign-extend that lives in a callee-saved register across the loop, and
 *   - call PrepItem_DrawUnitNameRow through a TU-local prototype whose 3rd arg is
 *     `int`, so agbcc does NOT re-narrow the loop-invariant value at each call.
 *
 * The callee's real definition keeps its s8 3rd parameter (it must, to byte-match
 * its own body), so we suppress prepscreen.h's s8 declaration only inside this TU
 * via the macro shadow below. include/prepscreen.h is left completely untouched.
 */
#define PrepItem_DrawUnitNameRow PrepItem_DrawUnitNameRow_hdr
#include "prepscreen.h"
#undef PrepItem_DrawUnitNameRow

void PrepItem_DrawUnitNameRow(struct PrepItemScreenProc *, u8, int);

void PrepItemScreen_DrawVisibleUnitNames(struct PrepItemScreenProc * proc, u8 flag)
{
    int i;
    int f = (s8)flag;

    for (i = (proc->scrollOffset >> 4); i < (proc->scrollOffset >> 4) + 4; i++)
        PrepItem_DrawUnitNameRow(proc, i, f);
}
