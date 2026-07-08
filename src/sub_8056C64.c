#include "global.h"

extern u32 frontier_df4_banim_a_res4[];

extern const struct ProcCmd ProcScr_efxSPDQuake[];

void sub_8056C64(void)
{
    Proc_Start((const struct ProcCmd *)((const u8 *)frontier_df4_banim_a_res4), (ProcPtr)3);
}
