#include "global.h"

extern const u8 data_08A600B0[];

void sub_80876E0(void)
{
    Proc_Start((const struct ProcCmd *)((const u8 *)data_08A600B0 + 0x60), (ProcPtr)4);
}
