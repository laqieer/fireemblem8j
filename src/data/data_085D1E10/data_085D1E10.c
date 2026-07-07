#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_085D1E10.
 *
 * 1 opaque proc script(s) decoded from the .data.residue.085D1E10
 * blob into typed struct ProcCmd NAME[] at their exact JP addresses:
 *   - gProcScr_CpPhase (5 ProcCmd) @0x085D1E10
 * Residue regions stay byte-identical (relocated pointers copied verbatim).
 * Redundant jp_syms .set aliases dropped. FUNC targets bare (ld ORs the
 * Thumb bit); gap_/OBJECT targets carry an explicit +1. The ONLY correctness
 * oracle is `make compare` (sha1).
 */

void AiPhaseInit(struct Proc * proc);
void AiPhaseBerserkInit(struct Proc * proc);
void AiPhaseCleanup(struct Proc * proc);
extern u8 gBmdifficulty_6[];

struct ProcCmd gProcScr_CpPhase[] __attribute__((section(".rodata.dat_gProcScr_CpPhase_ref"))) = {
    PROC_NAME((void *)((u8 *)gBmdifficulty_6 + 0x6C)),
    PROC_CALL(AiPhaseInit),
    PROC_YIELD,
    PROC_CALL(AiPhaseCleanup),
    PROC_END,
};

/* residue [085D1E38,085D1E60) (40 B): byte-identical. */
__asm__(
"\t.section .data.residue.085D1E38, \"aw\", %progbits\n"
"\t.global data_085D1E38\n"
"data_085D1E38:\n"
"\t.4byte 0x00000001\n"
"\t.4byte gBmdifficulty_6 + 0x78\n"
"\t.4byte 0x00000002\n"
"\t.4byte AiPhaseBerserkInit + 0x1\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte AiPhaseCleanup + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
