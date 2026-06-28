#include "global.h"
#include "proc.h"
#include "bm.h"
#include "bmio.h"
#include "bmlib.h"

extern void ArenaUi_StartPartialLock(ProcPtr proc);
extern char frontier_df4_menu_038_ABCD24[];
extern void ArenaUi_Init(ProcPtr proc);
extern void ArenaUi_ResultsDialogue(ProcPtr proc);
extern void ArenaUi_ShowGoldBoxOnVictoryOrDraw(ProcPtr proc);
extern void ArenaUi_UpdatePlayerUnitAfterBattle(ProcPtr proc);
extern void ArenaUi_OnEnd(ProcPtr proc);

struct ProcCmd gProcScr_ArenaUiResults[] __attribute__((section(".rodata.dat_gProcScr_ArenaUiResults_ref"))) = {
PROC_LABEL(1),
    PROC_CALL(ArenaUi_StartPartialLock),

    PROC_CALL(LockGame),
    PROC_CALL(BMapDispSuspend),
    PROC_SLEEP(0),

    PROC_START_CHILD((struct ProcCmd*)frontier_df4_menu_038_ABCD24),

    PROC_CALL(ArenaUi_Init),

    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0),

    PROC_CALL(ArenaUi_ResultsDialogue),
    PROC_SLEEP(0),

    PROC_CALL(ArenaUi_ShowGoldBoxOnVictoryOrDraw),
    PROC_SLEEP(0),

PROC_LABEL(2),
    PROC_SLEEP(1),

    PROC_END_EACH((struct ProcCmd*)frontier_df4_menu_038_ABCD24),
    PROC_SLEEP(0),

    PROC_CALL_ARG(_FadeBgmOut, 2),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0),

    PROC_CALL(ArenaUi_UpdatePlayerUnitAfterBattle),
    PROC_CALL(ArenaUi_OnEnd),
    PROC_CALL(ResetDialogueScreen),
    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartMapSongBgm),
    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(UnlockGame),
    PROC_END,
};
