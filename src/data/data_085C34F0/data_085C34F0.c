#include "global.h"
#include "proc.h"


extern struct ProcCmd ProcScr_CamMove[];
extern void ProcShowMapChange_MoveCamera();
extern void ProcShowMapChange_UpdateGame();

/* #148 proc-script decomp-completeness: data_085C34F0.
 *
 * 1 opaque proc script(s) decoded from the .data.residue.085C34F0
 * blob into typed struct ProcCmd NAME[] at their exact JP addresses:
 *   - ProcScr_PikeTrapAnim (4 ProcCmd) @0x085C3520
 * Residue regions stay byte-identical (relocated pointers copied verbatim).
 * Redundant jp_syms .set aliases dropped. FUNC targets bare (ld ORs the
 * Thumb bit); gap_/OBJECT targets carry an explicit +1. The ONLY correctness
 * oracle is `make compare` (sha1).
 */

extern void APProc_Exists();
extern void PikeTrapSpriteAnim_Init();

struct ProcCmd ProcScr_PikeTrapAnim[] __attribute__((section(".rodata.dat_ProcScr_PikeTrapAnim_ref"))) = {
    PROC_YIELD,
    PROC_CALL(PikeTrapSpriteAnim_Init),
    PROC_WHILE(APProc_Exists),
    PROC_END,
};

/* residue [085C34F0,085C3520) (48 B): byte-identical. */
struct ProcCmd ProcScr_ShowMapChangeAnim[] SECTION(".data.residue.085C34F0") = {
    PROC_SLEEP(0),
    PROC_CALL(ProcShowMapChange_MoveCamera + 0x1),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(ProcShowMapChange_UpdateGame + 0x1),
    PROC_WHILE(DoesBMXFADEExist + 0x1),
    PROC_END,
};

