#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_085BA00C.
 *
 * 1 opaque proc script(s) decoded from the .data.residue.085BA00C
 * blob into typed struct ProcCmd NAME[] at their exact JP addresses:
 *   - ProcScr_PopupUpdateIcon (1 ProcCmd) @0x085BA00C
 * Residue regions stay byte-identical (relocated pointers copied verbatim).
 * Redundant jp_syms .set aliases dropped. FUNC targets bare (ld ORs the
 * Thumb bit); gap_/OBJECT targets carry an explicit +1. The ONLY correctness
 * oracle is `make compare` (sha1).
 */

extern void PopupIconUpdateProc_Loop();

struct ProcCmd ProcScr_PopupUpdateIcon[] __attribute__((section(".rodata.dat_ProcScr_PopupUpdateIcon_ref"))) = {
    PROC_REPEAT(PopupIconUpdateProc_Loop),
};
