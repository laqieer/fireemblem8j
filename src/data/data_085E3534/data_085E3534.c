#include "global.h"
#include "proc.h"


extern void Nop_BanimEkrbattle_0();
extern void Nop_BanimEkrbattle_1();
extern void ekrBattleDeamon_Destructor();
extern void ekrBattleMain();
extern void ekrBattle_Init();

/* #148 proc-script decomp-completeness: data_085E3534.
 *
 * 2 opaque proc script(s) decoded from the .data.residue.085E3534
 * blob into typed struct ProcCmd NAME[] at their exact JP addresses:
 *   - ProcScr_ekrLvupFan (3 ProcCmd) @0x085E3580
 *   - ProcScr_ekrGauge (3 ProcCmd) @0x085E3598
 * Residue regions stay byte-identical (relocated pointers copied verbatim).
 * Redundant jp_syms .set aliases dropped. FUNC targets bare (ld ORs the
 * Thumb bit); gap_/OBJECT targets carry an explicit +1. The ONLY correctness
 * oracle is `make compare` (sha1).
 */

extern void EkrLvupFanMain();
extern void ekrGaugeMain();
extern u8 frontier_df4_misc_lo_005_0DF388[];

struct ProcCmd ProcScr_ekrLvupFan[] __attribute__((section(".rodata.dat_ProcScr_ekrLvupFan_ref"))) = {
    PROC_NAME((void *)((u8 *)frontier_df4_misc_lo_005_0DF388 + 0x24)),
    PROC_REPEAT(EkrLvupFanMain),
    PROC_END,
};

struct ProcCmd ProcScr_ekrGauge[] __attribute__((section(".rodata.dat_ProcScr_ekrGauge_ref"))) = {
    PROC_NAME((void *)((u8 *)frontier_df4_misc_lo_005_0DF388 + 0x30)),
    PROC_REPEAT(ekrGaugeMain),
    PROC_END,
};

/* residue [085E3534,085E3580) (76 B): byte-identical. */
__asm__(
    ".section .data.residue.085E3534, \"aw\", %progbits\n"
    "	.global data_085E3534\n"
    "data_085E3534:\n"
    "	.4byte 0x00000000\n"
);

struct ProcCmd ProcScr_ekrBattleDeamon_Destructor_085E3534_0[] SECTION(".data.residue.085E3534") = {
    PROC_NAME(frontier_df4_misc_lo_005_0DF388 + 0x8),
    PROC_SET_END_CB(ekrBattleDeamon_Destructor + 0x1),
    PROC_REPEAT(Nop_BanimEkrbattle_0 + 0x1),
    PROC_END,
};

struct ProcCmd ProcScr_Nop_BanimEkrbattle_1_085E3534_1[] SECTION(".data.residue.085E3534") = {
    PROC_NAME(frontier_df4_misc_lo_005_0DF388 + 0x18),
    PROC_SET_END_CB(Nop_BanimEkrbattle_1 + 0x1),
    PROC_REPEAT(ekrBattle_Init + 0x1),
    PROC_REPEAT(ekrBattleMain + 0x1),
    PROC_END,
};


/* residue [085E35B0,085E3604) (84 B): byte-identical. */
__asm__(
"\t.section .data.residue.085E35B0, \"aw\", %progbits\n"
"data_085E35B0:\n"
"\t.4byte 0x40004000\n"
"\t.4byte 0x00000180\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x40004000\n"
"\t.4byte 0x00200184\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00004000\n"
"\t.4byte 0x00400188\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0050018A\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00004000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
