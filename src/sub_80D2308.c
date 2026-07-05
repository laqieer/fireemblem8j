#include "global.h"

extern const u8 ProcScr_PromoSelect[];

void sub_80D2308(void)
{
    Proc_Start((const struct ProcCmd *)((const u8 *)ProcScr_PromoSelect + 0xD0), (ProcPtr)3);
}
