#include "global.h"

/* Migrated from asm/data_08577688.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08577688, \"aw\", %progbits\n"
"\t.global data_08577688\n"
"data_08577688:\n"
"\t.4byte Proc_BreakEach + 0x55\n"
"\t.4byte Proc_BreakEach + 0x61\n"
"\t.4byte Proc_BreakEach + 0x71\n"
"\t.4byte gap_00003080 + 0x49\n"
"\t.4byte gap_00003080 + 0x59\n"
"\t.4byte gap_00003080 + 0x75\n"
"\t.4byte gap_00003080 + 0x91\n"
"\t.4byte gap_00003080 + 0xAD\n"
"\t.4byte gap_00003080 + 0xCD\n"
"\t.4byte gap_00003080 + 0xF5\n"
"\t.4byte gap_00003080 + 0x111\n"
"\t.4byte gap_00003080 + 0x12D\n"
"\t.4byte gap_00003080 + 0x149\n"
"\t.4byte gap_00003080 + 0x139\n"
"\t.4byte UpdateSleep + 0x1D\n"
"\t.4byte UpdateSleep + 0x45\n"
"\t.4byte gap_00003240 + 0x1\n"
"\t.4byte gap_00003240 + 0x5\n"
"\t.4byte ProcCmd_SET_BIT4 + 0x1\n"
"\t.4byte UpdateSleep + 0x59\n"
"\t.4byte gap_00003080 + 0x1D\n"
"\t.4byte gap_00003240 + 0x7D\n"
"\t.4byte Proc_BreakEach + 0x85\n"
"\t.4byte gap_00003240 + 0x45\n"
"\t.4byte gap_00003080 + 0x1\n"
"\t.4byte gap_00003080 + 0x12D\n"
);  /* de-pointered slice data_08577688: ptr=26 data=0 skip=0 */
