#include "global.h"
#include "proc.h"

extern void PhaseIntroInitText(ProcPtr proc);
extern void PhaseIntroText_PutText(ProcPtr proc);
extern u16 obj_Phasechangefx_0[];
extern void PhaseIntroText_InLoop(ProcPtr proc);
extern void PhaseIntroText_OutLoop(ProcPtr proc);
extern void PhaseIntroClearText(ProcPtr proc);

struct ProcCmd gProcScr_PhaseIntroText[] __attribute__((section(".rodata.dat_gProcScr_PhaseIntroText_ref"))) = {
    PROC_CALL(PhaseIntroInitText),
    PROC_SLEEP(6),
    PROC_CALL(PhaseIntroText_PutText),
    PROC_START_CHILD((struct ProcCmd*)((u8*)obj_Phasechangefx_0 + 0x20)),
    PROC_REPEAT(PhaseIntroText_InLoop),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(PhaseIntroText_OutLoop),
    PROC_CALL(PhaseIntroClearText),
    PROC_END,
};
