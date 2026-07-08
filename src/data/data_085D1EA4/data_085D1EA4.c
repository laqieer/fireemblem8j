#include "global.h"
#include "proc.h"

extern const u8 DecideHealOrEscape[];
extern const u8 DecideScriptA[];
extern const u8 DecideScriptB[];
extern const u8 DecideSpecialItems[];

/* #148 proc-script decomp-completeness: data_085D1EA4.
 *
 * 1 opaque proc script(s) decoded from the .data.residue.085D1EBC
 * blob into typed struct ProcCmd NAME[] at their exact JP addresses:
 *   - gProcScr_CpDecide (7 ProcCmd) @0x085D1ED4
 * Residue regions stay byte-identical (relocated pointers copied verbatim).
 * Redundant jp_syms .set aliases dropped. FUNC targets bare (ld ORs the
 * Thumb bit); gap_/OBJECT targets carry an explicit +1. The ONLY correctness
 * oracle is `make compare` (sha1).
 */

extern void CpDecide_Main();
extern void CpDecide_Suspend();
extern struct ProcCmd data_080DCDAC[];

struct ProcCmd gProcScr_CpDecide[] __attribute__((section(".rodata.dat_gProcScr_CpDecide_ref"))) = {
    PROC_NAME(data_080DCDAC),
    PROC_LABEL(0),
    PROC_CALL(CpDecide_Main),
    PROC_YIELD,
    PROC_CALL(CpDecide_Suspend),
    PROC_GOTO(0),
    PROC_END,
};

/* residue [085D1EBC,085D1ED4) (24 B): byte-identical. */
u32 data_085D1EBC[] __attribute__((section(".data.residue.085D1EBC"))) = {
    (u32)&DecideSpecialItems + 0x1,
    (u32)&DecideScriptA + 0x1,
    (u32)&DecideHealOrEscape + 0x1,
    (u32)&DecideScriptB + 0x1,
    0x00000000,
    0x00000000,
};
