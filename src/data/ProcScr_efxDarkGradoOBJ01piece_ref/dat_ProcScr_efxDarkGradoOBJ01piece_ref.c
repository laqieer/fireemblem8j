#include "global.h"
#include "proc.h"

extern u8 ProcName_efxDarkGradoOBJ01piece[];
extern void efxDarkGradoOBJ01piece_Loop();

struct ProcCmd ProcScr_efxDarkGradoOBJ01piece[] __attribute__((section(".data.residue.08602D54"))) = {
    PROC_NAME(ProcName_efxDarkGradoOBJ01piece),
    PROC_REPEAT(efxDarkGradoOBJ01piece_Loop),
    PROC_END,
};

extern const u32 data_08602D54 __attribute__((alias("ProcScr_efxDarkGradoOBJ01piece")));
