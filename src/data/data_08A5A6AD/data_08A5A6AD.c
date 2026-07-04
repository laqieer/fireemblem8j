#include "global.h"

/* Migrated from asm/data_08A5A6AD.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* #143 shiftability: this residual blob holds 7 interior ROM pointers (3 into data_08A612F4,
 * 3 EventScr_Prologue_* scripts, 1 EventScr_GameOver) that emitted no relocation, so a
 * +0x40000-shifted ROM could not track them. Carve the pointer words to relocatable .4byte
 * refs; all non-pointer bytes stay .incbin. byte-exact (make compare is the oracle):
 * data_08A612F4+0x58/0x80/0x98 == 0x08A6134C/74/8C, and each EventScr_* is the exact word. */
__asm__(
"\t.section .data.residue.08A5A6AD, \"aw\", %progbits\n"
"\t.global data_08A5A6AD\n"
"data_08A5A6AD:\n"
"\t.incbin \"data/residual/data_08A5A6AD.bin\", 0, 0x7\n"
"\t.4byte data_08A612F4 + 0x58\n"
"\t.incbin \"data/residual/data_08A5A6AD.bin\", 0xB, 0x8\n"
"\t.4byte data_08A612F4 + 0x80\n"
"\t.incbin \"data/residual/data_08A5A6AD.bin\", 0x17, 0x8\n"
"\t.4byte data_08A612F4 + 0x98\n"
"\t.incbin \"data/residual/data_08A5A6AD.bin\", 0x23, 0x8\n"
"\t.4byte EventScr_Prologue_ONeillAttack\n"
"\t.incbin \"data/residual/data_08A5A6AD.bin\", 0x2F, 0x14\n"
"\t.4byte EventScr_Prologue_EndingScene\n"
"\t.incbin \"data/residual/data_08A5A6AD.bin\", 0x47, 0x8\n"
"\t.4byte EventScr_Prologue_OneEnemyLeft\n"
"\t.incbin \"data/residual/data_08A5A6AD.bin\", 0x53, 0x8\n"
"\t.4byte EventScr_GameOver\n"
"\t.incbin \"data/residual/data_08A5A6AD.bin\", 0x5F\n"
);

