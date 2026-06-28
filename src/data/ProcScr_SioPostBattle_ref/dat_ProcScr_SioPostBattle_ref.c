#include "global.h"
#include "proc.h"
#include "bmio.h"
#include "bmlib.h"

extern void SioPostBattle_Init(ProcPtr proc);
extern void FadeInBlackSpeed20(ProcPtr proc);
extern void Clear_UnkData_0(ProcPtr proc);
extern void SioPostBattle_Loop_Main(ProcPtr proc);
extern void SioPostBattle_AwaitAPress(ProcPtr proc);
extern void Set_UnkData_0(ProcPtr proc);
extern void FadeOutBlackSpeed20Locking(ProcPtr proc);

struct ProcCmd ProcScr_SioPostBattle[] __attribute__((section(".rodata.dat_ProcScr_SioPostBattle_ref"))) = {
    PROC_CALL(SioPostBattle_Init),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,

    PROC_CALL(Clear_UnkData_0),

    PROC_REPEAT(SioPostBattle_Loop_Main),
    PROC_REPEAT(SioPostBattle_AwaitAPress),

    PROC_CALL(Set_UnkData_0),

    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_YIELD,

    PROC_CALL(BMapVSync_Start),

    PROC_END,
};
