#include "global.h"
#include "proc.h"

extern void BackToAttackMenu_CamWatch();
extern void BackToAttackMenu_RestartMenu();
extern void LockGame();
extern void UnlockGame();
extern struct ProcCmd ProcScr_CamMove[];
extern struct ProcCmd gProcScr_BKSEL[];

struct ProcCmd gProcScr_Bmmenu_0[] __attribute__((section(".data.residue.085C3B10"))) = {
    PROC_CALL(LockGame),
    PROC_CALL(BackToAttackMenu_CamWatch),
    PROC_WHILE_EXISTS(gProcScr_BKSEL),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(BackToAttackMenu_RestartMenu),
    PROC_CALL(UnlockGame),
    PROC_END,
};

extern const u32 data_085C3B10 __attribute__((alias("gProcScr_Bmmenu_0")));
