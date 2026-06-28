#include "global.h"
#include "proc.h"
#include "bmio.h"
#include "bmlib.h"

extern void ChapterIntroTitle_InitBgImg(ProcPtr proc);
extern u8 data_085C3560[];
extern void sub_8020D78(ProcPtr proc);
extern void ChapterIntroTitle_ResetBg(ProcPtr proc);
extern void ChapterIntro_InitCameraYPos(ProcPtr proc);
extern void ChapterIntroTitle_End(ProcPtr proc);

struct ProcCmd gProcScr_ChapterIntroTitleOnly[] __attribute__((section(".rodata.dat_gProcScr_ChapterIntroTitleOnly_ref"))) = {
    PROC_CALL(BMapDispSuspend),

    PROC_CALL(ChapterIntroTitle_InitBgImg),

    PROC_START_CHILD((struct ProcCmd*)(data_085C3560 + 0x10)),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL_ARG(sub_8020D78, 0x63),

    PROC_SLEEP(0xB4),

PROC_LABEL(0x63),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

PROC_LABEL(0x3E7),
    PROC_CALL(ChapterIntroTitle_ResetBg),
    PROC_CALL(ChapterIntro_InitCameraYPos),
    PROC_CALL(BMapDispResume),

    PROC_CALL(ChapterIntroTitle_End),
    PROC_SLEEP(0),

    PROC_END,
};
