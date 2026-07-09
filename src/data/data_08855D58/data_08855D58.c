#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_08855D58.
 *
 * 2 opaque proc script(s) decoded from the .data.residue.08855D58
 * blob into typed struct ProcCmd NAME[] at their exact JP addresses:
 *   - ProcScr_EkrdragonDemonkingobj_2 (3 ProcCmd) @0x08855D98
 *   - ProcScr_ekrSelfThunder (3 ProcCmd) @0x08855DC0
 * Residue regions stay byte-identical (relocated pointers copied verbatim).
 * Redundant jp_syms .set aliases dropped. FUNC targets bare (ld ORs the
 * Thumb bit); gap_/OBJECT targets carry an explicit +1. The ONLY correctness
 * oracle is `make compare` (sha1).
 */

extern void EkrDemonkingObj_DissolveInit();
extern void EkrDemonkingObj_DissolveLoop();
extern void EkrSelfThunderMain();
extern u8 sBanimEkrPopupProcNames[];

struct ProcCmd ProcScr_EkrdragonDemonkingobj_2[] __attribute__((section(".rodata.dat_ProcScr_EkrdragonDemonkingobj_2_ref"))) = {
    PROC_CALL(EkrDemonkingObj_DissolveInit),
    PROC_REPEAT(EkrDemonkingObj_DissolveLoop),
    PROC_END,
};

struct ProcCmd ProcScr_ekrSelfThunder[] __attribute__((section(".rodata.dat_ProcScr_ekrSelfThunder_ref"))) = {
    PROC_NAME((void *)((u8 *)sBanimEkrPopupProcNames + 0x154)),
    PROC_REPEAT(EkrSelfThunderMain),
    PROC_END,
};

/* residue [08855D58,08855D98) (64 B): byte-identical. */

/* residue [08855DB0,08855DC0) (16 B): byte-identical. */

/* residue [08855DD8,08855DF8) (32 B): byte-identical. */
