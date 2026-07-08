#include "global.h"
#include "proc.h"

extern u8 ProcName_efxLunaBG2[];
extern void sub_8064F58();
extern void efxLunaBG2_Loop();

struct ProcCmd ProcScr_efxLunaBG2[] __attribute__((section(".data.residue.08601388"))) = {
    PROC_NAME(ProcName_efxLunaBG2),
    PROC_SET_END_CB(sub_8064F58),
    PROC_REPEAT(efxLunaBG2_Loop),
    PROC_END,
};

extern const u32 data_08601388 __attribute__((alias("ProcScr_efxLunaBG2")));
