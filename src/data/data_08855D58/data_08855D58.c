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
extern u8 data_080ED67C[];

struct ProcCmd ProcScr_EkrdragonDemonkingobj_2[] __attribute__((section(".rodata.dat_ProcScr_EkrdragonDemonkingobj_2_ref"))) = {
    PROC_CALL(EkrDemonkingObj_DissolveInit),
    PROC_REPEAT(EkrDemonkingObj_DissolveLoop),
    PROC_END,
};

struct ProcCmd ProcScr_ekrSelfThunder[] __attribute__((section(".rodata.dat_ProcScr_ekrSelfThunder_ref"))) = {
    PROC_NAME((void *)((u8 *)data_080ED67C + 0x154)),
    PROC_REPEAT(EkrSelfThunderMain),
    PROC_END,
};

/* residue [08855D58,08855D98) (64 B): byte-identical. */
__asm__(
"\t.section .data.residue.08855D58, \"aw\", %progbits\n"
"\t.global data_08855D58\n"
"data_08855D58:\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_807A154 + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EkrDemonkingObj_UpdateBgPosLoop + 0x1\n"
"\t.4byte 0x00000004\n"
"\t.4byte EkrDemonkingObj_RevealOnEnd + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte EkrDemonkingObj_RevealInit + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte EkrDemonkingObj_RevealTimerInit + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EkrDemonkingObj_RevealLoop + 0x1\n"
"\t.4byte 0x00000008\n"
"\t.4byte ProcScr_EkrdragonDemonkingobj_2\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);

/* residue [08855DB0,08855DC0) (16 B): byte-identical. */
__asm__(
"\t.section .data.residue.08855DB0, \"aw\", %progbits\n"
"data_08855DB0:\n"
"\t.4byte 0x00F0000F\n"
"\t.4byte 0xF0000F00\n"
"\t.4byte 0x00100001\n"
"\t.4byte 0x10000100\n"
);

/* residue [08855DD8,08855DF8) (32 B): byte-identical. */
__asm__(
"\t.section .data.residue.08855DD8, \"aw\", %progbits\n"
"data_08855DD8:\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_080ED67C + 0x164\n"
"\t.4byte 0x00000002\n"
"\t.4byte EfxSelfThunderBGOnInit + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EfxSelfThunderBGMain + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
