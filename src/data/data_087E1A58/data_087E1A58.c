#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_087E1A58.
 *
 * 2 opaque proc script(s) decoded from the .data.residue.087E1A58
 * blob into typed struct ProcCmd NAME[] at their exact JP addresses:
 *   - ProcScr_ekrPopup (13 ProcCmd) @0x087E1A78
 *   - ProcScr_ekrPopup2 (13 ProcCmd) @0x087E1AE0
 * Residue regions stay byte-identical (relocated pointers copied verbatim).
 * Redundant jp_syms .set aliases dropped. FUNC targets bare (ld ORs the
 * Thumb bit); gap_/OBJECT targets carry an explicit +1. The ONLY correctness
 * oracle is `make compare` (sha1).
 */

extern void BattlePopup_Wait16Frames();
extern void ekrPopup_DrawWRankUp();
extern void ekrPopup_DrawWRankUp2();
extern void ekrPopup_DrawWpnBroke();
extern void ekrPopup_DrawWpnBroke2();
extern void ekrPopup_DrawWpnUsable();
extern void ekrPopup_DrawWpnUsable2();
extern void ekrPopup_MarkEnd();
extern void ekrPopup_WaitWRankUp();
extern void ekrPopup_WaitWRankUp2();
extern void ekrPopup_WaitWpnBroke();
extern void ekrPopup_WaitWpnBroke2();
extern void ekrPopup_WaitWpnUsable();
extern void nullsub_62();
extern u8 data_080ED67C[];

struct ProcCmd ProcScr_ekrPopup[] __attribute__((section(".rodata.dat_ProcScr_ekrPopup_ref"))) = {
    PROC_NAME(data_080ED67C),
    PROC_REPEAT(BattlePopup_Wait16Frames),
    PROC_REPEAT(ekrPopup_DrawWRankUp),
    PROC_REPEAT(ekrPopup_WaitWpnBroke),
    PROC_REPEAT(ekrPopup_DrawWRankUp2),
    PROC_REPEAT(ekrPopup_WaitWRankUp),
    PROC_REPEAT(ekrPopup_DrawWpnBroke),
    PROC_REPEAT(ekrPopup_WaitWRankUp2),
    PROC_REPEAT(ekrPopup_DrawWpnBroke2),
    PROC_REPEAT(ekrPopup_WaitWpnBroke2),
    PROC_REPEAT(ekrPopup_MarkEnd),
    PROC_REPEAT(nullsub_62),
    PROC_END,
};

struct ProcCmd ProcScr_ekrPopup2[] __attribute__((section(".rodata.dat_ProcScr_ekrPopup2_ref"))) = {
    PROC_NAME((void *)((u8 *)data_080ED67C + 0xC)),
    PROC_REPEAT(BattlePopup_Wait16Frames),
    PROC_LABEL(0),
    PROC_REPEAT(ekrPopup_DrawWpnUsable),
    PROC_REPEAT(ekrPopup_WaitWpnUsable),
    PROC_SLEEP(20),
    PROC_LABEL(1),
    PROC_REPEAT(ekrPopup_DrawWpnUsable2),
    PROC_REPEAT(ekrPopup_WaitWpnUsable),
    PROC_LABEL(5),
    PROC_REPEAT(ekrPopup_MarkEnd),
    PROC_REPEAT(nullsub_62),
    PROC_END,
};

/* residue [087E1A58,087E1A78) (32 B): byte-identical. */
__asm__(
"\t.section .data.residue.087E1A58, \"aw\", %progbits\n"
"\t.global data_087E1A58\n"
"data_087E1A58:\n"
"\t.4byte 0x40000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte data_087E1A58 + 0x1\n"
"\t.4byte 0x80000000\n"
);

/* residue [087E1B48,087E1BA0) (88 B): byte-identical. */
__asm__(
"\t.section .data.residue.087E1B48, \"aw\", %progbits\n"
"data_087E1B48:\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_080ED67C + 0x18\n"
"\t.4byte 0x00000003\n"
"\t.4byte EkrHenseiInit_Init + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EkrHenseiInit_SetupFade + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EkrHenseiInit_FadeInLoop + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EkrHenseiInit_End + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_080ED67C + 0x2C\n"
"\t.4byte 0x00000003\n"
"\t.4byte EkrHenseiEnd_Init + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EkrHenseiEnd_FadeOutLoop + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EkrHenseiEnd_End + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
