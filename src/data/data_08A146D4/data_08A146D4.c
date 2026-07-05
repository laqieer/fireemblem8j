#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_08A146D4 (mapanim_spellassocfx).
 *
 * These three proc scripts previously existed ONLY as raw `.4byte` residue words
 * in the `.data.residue.08A146D4` section (opcode/imm/ptr words invisible to
 * `make shiftcheck`). Each table is decoded (from JP bytes, pointers resolved
 * against the freshly-built ELF) into its OWN 4-aligned `.rodata.dat_NAME_ref`
 * section, which the carved_rom layout places at its exact JP address. The whole
 * object [0x08A146D4,0x08A14734) is covered by the three tables (no residue).
 * Every pointer word becomes an R_ARM_ABS32 relocation; FUNC targets are bare
 * (NO addend -- ld ORs the Thumb bit). The ONLY correctness oracle is
 * `make compare` (sha1). The redundant baseline `.set` names for the carved
 * tables are dropped in layout/baseline_syms_drop.d/procscr_data_08A146D4_148.tsv.
 */

extern void BG0Shaker_Init();
extern void BG0Shaker_Loop();
extern void LockGame();
extern void MapAnimRotation_Init();
extern void MapAnimRotation_Main();
extern void SpellAssocResetPalMain();
extern void UnlockGame();

struct ProcCmd ProcScr_MapAnimSpellAssocResetPal[] __attribute__((section(".rodata.dat_ProcScr_MapAnimSpellAssocResetPal_ref"))) = {
    PROC_CALL(SpellAssocResetPalMain), PROC_SLEEP(0x10), PROC_END,
};

struct ProcCmd ProcScr_MapAnimBgShaker[] __attribute__((section(".rodata.dat_ProcScr_MapAnimBgShaker_ref"))) = {
    PROC_CALL(BG0Shaker_Init), PROC_REPEAT(BG0Shaker_Loop), PROC_END,
};

struct ProcCmd ProcScr_MapAnimSpellAssocRotationEffect[] __attribute__((section(".rodata.dat_ProcScr_MapAnimSpellAssocRotationEffect_ref"))) = {
    PROC_CALL(LockGame), PROC_SLEEP(0x1), PROC_CALL(MapAnimRotation_Init), PROC_REPEAT(MapAnimRotation_Main),
    PROC_CALL(UnlockGame), PROC_END,
};
