#include "global.h"
#include "proc.h"

extern u8 ProcName_efxCrimsonEyeOBJFinish[];
extern void efxCrimsonEyeOBJFinish_Loop();

struct ProcCmd ProcScr_efxCrimsonEyeOBJFinish[] __attribute__((section(".data.residue.08602EAC"))) = {
    PROC_NAME(ProcName_efxCrimsonEyeOBJFinish),
    PROC_REPEAT(efxCrimsonEyeOBJFinish_Loop),
    PROC_END,
};

extern const u32 data_08602EAC __attribute__((alias("ProcScr_efxCrimsonEyeOBJFinish")));
