#include "global.h"
#include "proc.h"

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
__asm__(
"\t.section .data.residue.085C34F0, \"aw\", %progbits\n"
"\t.global ProcScr_ShowMapChangeAnim\n"
"ProcScr_ShowMapChangeAnim:\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte ProcShowMapChange_MoveCamera + 0x1\n"
"\t.4byte 0x00000008\n"
"\t.4byte ProcScr_CamMove\n"
"\t.4byte 0x00000002\n"
"\t.4byte ProcShowMapChange_UpdateGame + 0x1\n"
"\t.4byte 0x00000014\n"
"\t.4byte DoesBMXFADEExist + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
