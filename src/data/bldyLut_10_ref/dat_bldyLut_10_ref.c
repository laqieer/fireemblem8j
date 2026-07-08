#include "global.h"
#include "proc.h"

/* Migrated from asm/dat_bldyLut_10_ref.s. GCC label `bldyLut.10` is unreferenced;
 * the consumer (SubtitleHelpDarkenerOnHBlank.c) uses SubtitleHelpDarkener_BldyLut.
 *
 * #143 shiftability: split the 74-byte residual blob into the real 34-byte
 * SubtitleHelpDarkener_BldyLut (indexed by SubtitleHelpDarkenerOnHBlank) + the
 * 40-byte gProcScr_SubtitleHelpDarkener proc script (JP 0x085C6668), so the
 * script's 3 interior code pointers become R_ARM_ABS32 relocations instead of
 * raw 0x0803.. words that stay un-relocated and crash the +0x40000 shifted ROM. */

extern void SubtitleHelpDarkener_Init(ProcPtr proc);
extern void SubtitleHelpDarkener_FadeIn(ProcPtr proc);
extern void SubtitleHelpDarkener_FadeOut(ProcPtr proc);

SECTION(".rodata.dat_bldyLut_10_ref") const u8 SubtitleHelpDarkener_BldyLut[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
    0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x00, 0x00,
};

SECTION(".rodata.gProcScr_SubtitleHelpDarkener") struct ProcCmd gProcScr_SubtitleHelpDarkener[] = {
    PROC_END_DUPLICATES,                          /* 5C6668  17 */
    PROC_CALL(SubtitleHelpDarkener_Init),         /* 5C6670  ptr@5C6674 = 0803551D */
    PROC_REPEAT(SubtitleHelpDarkener_FadeIn),     /* 5C6678  ptr@5C667C = 08035539 */
    PROC_REPEAT(SubtitleHelpDarkener_FadeOut),    /* 5C6680  ptr@5C6684 = 08035555 */
    PROC_END,                                     /* 5C6688  00 */
};
