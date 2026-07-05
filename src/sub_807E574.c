#include "global.h"

/* #143 shiftability: ProcScr_SIOMAIN2 was hardcoded as the magic literal
 * 0x08A13E9C, emitted as a raw literal-pool word that a +0x40000 shift left
 * un-relocated. Reference the symbol so ld emits an R_ARM_ABS32 (STT_OBJECT
 * target, even address -> byte-identical literal, no Thumb bit). */
extern struct ProcCmd ProcScr_SIOMAIN2[];

void sub_807E574(void)
{
    Proc_Start((const struct ProcCmd *)ProcScr_SIOMAIN2, (ProcPtr)3);
}
