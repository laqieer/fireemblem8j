#include "global.h"
#include "proc.h"
#include "bmlib.h" /* FadeInBlackSpeed20, FadeOutBlackSpeed20Locking */

extern void Title_Init(ProcPtr proc);
extern void Title_SetupMainGraphics(ProcPtr proc);
extern void TitleScreenTryJumpIntroAnim(ProcPtr proc);
extern void Title_EnableMainScreenDisplay(void);
extern void Title_StartSkipFxListener(ProcPtr proc);
extern void Title_SetupSpecialEffectGraphics(ProcPtr proc);
extern void Title_PrepareRotatingBlueLights(ProcPtr proc);
extern void Title_Loop_DrawRotatingBlueLights(ProcPtr proc);
extern void Title_PrepareRedBlueOrbs(ProcPtr proc);
extern void Title_Loop_DrawRedBlueOrbs(ProcPtr proc);
extern void Title_PrepareMainScreenWithExtendedBgm(ProcPtr proc);
extern void Title_Loop_RevealGreenDragonFlashFx(ProcPtr proc);
extern void Title_Loop_FlashFxExpand(ProcPtr proc);
extern void Title_LoadDemonKingOnBg2(ProcPtr proc);
extern void Title_ShowBg2(ProcPtr proc);
extern void Title_ShowBg1AfterDemonKing(ProcPtr proc);
extern void Title_EndSkipFxListener(void);
extern void Title_PrepareMainLogoZoom(ProcPtr proc);
extern void Title_Loop_MainLogoZoom(ProcPtr proc);
extern void Title_PrepareLightExplosionFx(ProcPtr proc);
extern void Title_Loop_LightExplosionFx(ProcPtr proc);
extern void Title_EnterMainScreen(ProcPtr proc);
extern void Title_IDLE(ProcPtr proc);
extern void Title_EndAllProcChildren(ProcPtr proc);
extern void Title_RestartProc(ProcPtr proc);

struct ProcCmd gProcScr_TitleScreen[] __attribute__((section(".rodata.dat_gProcScr_TitleScreen_ref"))) = {
PROC_LABEL(4),
    PROC_YIELD,
    PROC_CALL(Title_Init),
    PROC_REPEAT(Title_SetupMainGraphics),
    PROC_CALL(TitleScreenTryJumpIntroAnim),
    PROC_CALL(Title_EnableMainScreenDisplay),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_YIELD,
    PROC_GOTO(1),
PROC_LABEL(0),
    PROC_YIELD,
    PROC_CALL(Title_StartSkipFxListener),
    PROC_REPEAT(Title_SetupSpecialEffectGraphics),
    PROC_CALL(Title_PrepareRotatingBlueLights),
    PROC_REPEAT(Title_Loop_DrawRotatingBlueLights),
    PROC_CALL(Title_PrepareRedBlueOrbs),
    PROC_REPEAT(Title_Loop_DrawRedBlueOrbs),
    PROC_CALL(Title_PrepareMainScreenWithExtendedBgm),
    PROC_REPEAT(Title_Loop_RevealGreenDragonFlashFx),
    PROC_REPEAT(Title_Loop_FlashFxExpand),
    PROC_YIELD,
    PROC_CALL(Title_LoadDemonKingOnBg2),
    PROC_SLEEP(8),
    PROC_CALL(Title_ShowBg2),
    PROC_SLEEP(2),
    PROC_CALL(Title_ShowBg1AfterDemonKing),
    PROC_SLEEP(8),
    PROC_CALL(Title_EndSkipFxListener),
    PROC_CALL(Title_PrepareMainLogoZoom),
    PROC_REPEAT(Title_Loop_MainLogoZoom),
    PROC_CALL(Title_PrepareLightExplosionFx),
    PROC_REPEAT(Title_Loop_LightExplosionFx),
    PROC_CALL(Title_EnterMainScreen),
PROC_LABEL(1),
    PROC_REPEAT(Title_IDLE),
PROC_LABEL(2),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_YIELD,
    PROC_CALL(Title_EndAllProcChildren),
    PROC_GOTO(5),
PROC_LABEL(3),
    PROC_CALL(Title_RestartProc),
    PROC_GOTO(4),
PROC_LABEL(5),
    PROC_END,
};
