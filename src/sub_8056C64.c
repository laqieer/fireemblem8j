#include "global.h"

extern const struct ProcCmd ProcScr_efxSPDQuake[];

void sub_8056C64(void)
{
    Proc_Start((const struct ProcCmd *)((const u8 *)ProcScr_efxSPDQuake + 0x20), (ProcPtr)3);
}
