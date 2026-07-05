#include "global.h"
#include "proc.h"
#include "bb.h"

/* gProcScr_SubtitleHelp @0x085C6698 (7 ProcCmd, 56 bytes). Region-same: byte-
 * identical to fe8u src/bb.c gProcScr_SubtitleHelp[]. Previously this proc script
 * was de-pointered and embedded at +8 inside the lut_29_ref blob, between the
 * SubtitleHelp_TextShowLut show lut (8 B, consumed by SubtitleHelp_Loop.c) and a
 * second show lut + proc script (lut2 + data_085C66D8); it is now a single typed
 * table in its own section, placed between them by the layout split.
 *
 * SubtitleHelp_Init / SubtitleHelp_OnEnd / SubtitleHelp_Loop are Thumb functions
 * (declared in bb.h), so bare PROC_*() gets the Thumb bit from the R_ARM_ABS32
 * reloc. The PROC_NAME "BB" string lives at 0x080DCCE0, which is interior to the
 * carved data_080DCCB2 resource ([0x080DCCB2,0x080DCD88)), so it is referenced as
 * data_080DCCB2 + 0x2E -- matching the pre-split de-pointered reference exactly. */

extern const u8 data_080DCCB2[];

struct ProcCmd gProcScr_SubtitleHelp[] __attribute__((section(".rodata.dat_ProcScr_SubtitleHelp148_ref"))) = {
    PROC_NAME((void *)((u8 *)data_080DCCB2 + 0x2E)),
    PROC_15,
    PROC_SET_END_CB(SubtitleHelp_OnEnd),
    PROC_SLEEP(0),
    PROC_CALL(SubtitleHelp_Init),
    PROC_REPEAT(SubtitleHelp_Loop),
    PROC_BLOCK,
};
