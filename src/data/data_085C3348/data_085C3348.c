#include "global.h"

/* Migrated from asm/data_085C3348.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.085C3348, \"aw\", %progbits\n"
"\t.global data_085C3348\n"
"data_085C3348:\n"
"\t.4byte 0x41000005\n"
"\t.4byte 0x0000C000\n"
"\t.4byte 0xC0404100\n"
"\t.4byte 0x41000008\n"
"\t.4byte 0x0010C080\n"
"\t.4byte 0x80C00100\n"
"\t.4byte 0x81000018\n"
"\t.4byte 0x001C80E0\n"
"\t.4byte 0x00000002\n"
"\t.4byte PhaseIntroUnk_Init + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte PhaseIntroUnk_Loop + 0x1\n"
);  /* de-pointered slice data_085C3348: ptr=2 data=10 skip=0 */
