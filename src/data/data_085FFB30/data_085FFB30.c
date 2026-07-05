#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_085FFB30 (banim efxmagic aircalibur).
 *
 * Three proc scripts (gProcScr_efxAlacaliburBG / BGCOL / OBJ) plus the TSA
 * pointer pair TsaArray_AircaliburBg previously existed ONLY as raw `.4byte`
 * residue words in the `.data.residue.085FFB30` blob -- opcode/imm/ptr words
 * invisible to `make shiftcheck`. Each proc table is decoded (from JP bytes,
 * pointers resolved against the freshly-built ELF) into its OWN 4-aligned
 * `.rodata.dat_NAME_ref` section, which the carved_rom layout places at its
 * exact JP address; the 8-byte TSA pointer array wedged between the BG and
 * BGCOL tables is likewise given a typed, relocated definition (matching its
 * efxmagic.h declaration + banim-efxmagic-aircalibur.c consumer) instead of
 * being left as un-relocated INCBIN bytes.
 *
 * Every pointer word thus becomes an R_ARM_ABS32 relocation. FUNC targets are
 * bare (NO addend -- ld ORs the Thumb bit); the PROC_NAME string pointers use
 * byte-exact (u8*) arithmetic into the shared frontier_df4_misc_lo name blob
 * (same idiom as src/data/frontier_df4_banim_a.c). REGION_SAME structure; the
 * ONLY correctness oracle is `make compare` (sha1). The redundant baseline
 * auto-symbols for the four carved names are dropped in
 * layout/baseline_syms_drop.d/procscr_data_085FFB30_148.tsv.
 */

extern u8 frontier_df4_misc_lo_007_0E1870[];
extern u16 Tsa_AircaliburBg_A[];
extern u16 Tsa_AircaliburBg_B[];
extern void efxAlacaliburBG_Loop();
extern void efxAlacaliburBGCOL_Loop();
extern void efxAlacaliburOBJ_Loop();

struct ProcCmd gProcScr_efxAlacaliburBG[] __attribute__((section(".rodata.dat_gProcScr_efxAlacaliburBG_ref"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x818)),
    PROC_REPEAT(efxAlacaliburBG_Loop),
    PROC_END,
};

u16 * TsaArray_AircaliburBg[] __attribute__((section(".rodata.dat_TsaArray_AircaliburBg_ref"))) = {
    Tsa_AircaliburBg_A,
    Tsa_AircaliburBg_B,
};

struct ProcCmd gProcScr_efxAlacaliburBGCOL[] __attribute__((section(".rodata.dat_gProcScr_efxAlacaliburBGCOL_ref"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x834)),
    PROC_MARK(0xA),
    PROC_REPEAT(efxAlacaliburBGCOL_Loop),
    PROC_END,
};

struct ProcCmd gProcScr_efxAlacaliburOBJ[] __attribute__((section(".rodata.dat_gProcScr_efxAlacaliburOBJ_ref"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_007_0E1870 + 0x864)),
    PROC_REPEAT(efxAlacaliburOBJ_Loop),
    PROC_END,
};
