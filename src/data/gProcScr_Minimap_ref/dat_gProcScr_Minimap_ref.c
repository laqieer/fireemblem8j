#include "global.h"
#include "proc.h"

extern void ClearBg0Bg1();
extern void InitMinimapFlashPalette();
extern void LoadObjUIGfx();
extern void LoadUiFrameGraphics();
extern void LockGame();
extern void Minimap_AdjustCursorOnClose();
extern void Minimap_AdjustDisplay();
extern void Minimap_CloseAnim();
extern void Minimap_Init();
extern void Minimap_InitCloseAnim();
extern void Minimap_InitOpenAnim();
extern void Minimap_Main();
extern void Minimap_OpenAnim();
extern void ResetText();
extern void UnlockGame();

struct ProcCmd gProcScr_Minimap[] __attribute__((section(".data.residue.08A9CA64"))) = {
    PROC_CALL(LockGame),
    PROC_SLEEP(0x0),
    PROC_CALL(ClearBg0Bg1),
    PROC_SLEEP(0x0),
    PROC_CALL(Minimap_Init),
    PROC_CALL(Minimap_AdjustDisplay),
    PROC_CALL(Minimap_InitOpenAnim),
    PROC_REPEAT(Minimap_OpenAnim),
    PROC_CALL(InitMinimapFlashPalette),
    PROC_REPEAT(Minimap_Main),
    PROC_CALL(Minimap_InitCloseAnim),
    PROC_REPEAT(Minimap_CloseAnim),
    PROC_CALL(Minimap_AdjustCursorOnClose),
    PROC_CALL(ClearBg0Bg1),
    PROC_SLEEP(0x0),
    PROC_CALL(LoadUiFrameGraphics),
    PROC_CALL(ResetText),
    PROC_CALL(LoadObjUIGfx),
    PROC_CALL(UnlockGame),
    PROC_END,
};

__asm__(".global data_08A9CA64\n.set data_08A9CA64, gProcScr_Minimap");
