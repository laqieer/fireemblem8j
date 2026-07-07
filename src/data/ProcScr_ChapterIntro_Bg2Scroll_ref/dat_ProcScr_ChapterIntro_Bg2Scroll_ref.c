#include "global.h"
#include "proc.h"

extern void ChapterIntro_Bg2Scroll_Loop();

struct ProcCmd ProcScr_ChapterIntro_Bg2Scroll[] __attribute__((section(".data.residue.085C3560"))) = {
    PROC_REPEAT(ChapterIntro_Bg2Scroll_Loop),
    PROC_END,
};

__asm__(".global data_085C3560\n.set data_085C3560, ProcScr_ChapterIntro_Bg2Scroll");
