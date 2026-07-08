#include "global.h"
#include "proc.h"

extern void ArenaUi_CheckConfirmation();
extern void ArenaUi_ConfirmWager();
extern void ArenaUi_GoodLuckDialogue();
extern void ArenaUi_Init();
extern void ArenaUi_InstructionsDialogue();
extern void ArenaUi_OnEnd();
extern void ArenaUi_StartArenaBattle();
extern void ArenaUi_WagerGoldDialogue();
extern void ArenaUi_WelcomeDialogue();
extern void BMapDispResume();
extern void BMapDispSuspend();
extern void FadeInBlackSpeed20();
extern void FadeOutBlackSpeed20Locking();
extern void LockGame();
extern void RefreshBMapGraphics();
extern void StartMapSongBgm();
extern void StartMidFadeFromBlack();
extern void StartMidFadeToBlack();
extern void UnlockGame();
extern void WaitForFade();
extern void _FadeBgmOut();
extern void _StartBgm();
extern struct ProcCmd gProcScr_ArenaUiResults[];

struct ProcCmd gProcScr_ArenaUiMain[] __attribute__((section(".data.residue.08ABCAD4"))) = {
    PROC_CALL(LockGame),
    PROC_SLEEP(0x1),
    PROC_CALL_ARG(_FadeBgmOut, 0xFFFF),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL_ARG(_StartBgm, 0x38),
    PROC_CALL(ArenaUi_Init),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0x1),
    PROC_CALL(ArenaUi_WelcomeDialogue),
    PROC_SLEEP(0x1),
    PROC_CALL(ArenaUi_WagerGoldDialogue),
    PROC_SLEEP(0x1),
    PROC_CALL(ArenaUi_CheckConfirmation),
    PROC_SLEEP(0x1),
    PROC_CALL(ArenaUi_ConfirmWager),
    PROC_SLEEP(0x1),
    PROC_CALL(ArenaUi_InstructionsDialogue),
    PROC_SLEEP(0x1),
    PROC_CALL(ArenaUi_GoodLuckDialogue),
    PROC_SLEEP(0x1),
    PROC_LABEL(0x0),
    PROC_CALL_ARG(_FadeBgmOut, 0x2),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x1),
    PROC_CALL(ArenaUi_StartArenaBattle),
    PROC_SLEEP(0x1),
    PROC_CALL(UnlockGame),
    PROC_CALL(BMapDispResume),
    PROC_JUMP(gProcScr_ArenaUiResults),
    PROC_LABEL(0x2),
    PROC_SLEEP(0x1),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x1),
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

extern const u32 data_08ABCAD4 __attribute__((alias("gProcScr_ArenaUiMain")));
